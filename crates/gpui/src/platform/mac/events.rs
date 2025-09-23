use crate::{
    Capslock, KeyDownEvent, KeyUpEvent, Keystroke, Modifiers, ModifiersChangedEvent, MouseButton,
    MouseDownEvent, MouseExitEvent, MouseMoveEvent, MouseUpEvent, NavigationDirection, Pixels,
    PlatformInput, ScrollDelta, ScrollWheelEvent, TouchPhase,
    platform::mac::{
        LMGetKbdType, NSStringExt, TISCopyCurrentKeyboardLayoutInputSource,
        TISGetInputSourceProperty, UCKeyTranslate, kTISPropertyUnicodeKeyLayoutData,
    },
    point, px,
};
use icrate::AppKit::NSEvent;
use objc::runtime::Object;
use objc::{msg_send, sel, sel_impl};
type ObjcId = *mut Object;
use core_foundation::data::{CFDataGetBytePtr, CFDataRef};
use core_graphics::event::CGKeyCode;
// Using objc2/icrate later for typed constants; current code retains numeric masks and values
// objc msg_send imported above
use icrate::AppKit::{
    // Modifier flags
    NSEventModifierFlagCapsLock,
    NSEventModifierFlagCommand,
    NSEventModifierFlagControl,
    NSEventModifierFlagFunction,
    NSEventModifierFlagOption,
    NSEventModifierFlagShift,
    // Phases
    NSEventPhaseBegan,
    NSEventPhaseEnded,
    NSEventPhaseMayBegin,
    NSEventTypeFlagsChanged,
    NSEventTypeKeyDown,
    NSEventTypeKeyUp,
    // Event types
    NSEventTypeLeftMouseDown,
    NSEventTypeLeftMouseDragged,
    NSEventTypeLeftMouseUp,
    NSEventTypeMouseExited,
    NSEventTypeMouseMoved,
    NSEventTypeOtherMouseDown,
    NSEventTypeOtherMouseDragged,
    NSEventTypeOtherMouseUp,
    NSEventTypeRightMouseDown,
    NSEventTypeRightMouseDragged,
    NSEventTypeRightMouseUp,
    NSEventTypeScrollWheel,
    NSEventTypeSwipe,
};
use std::{borrow::Cow, ffi::c_void};

const BACKSPACE_KEY: u16 = 0x7f;
const SPACE_KEY: u16 = b' ' as u16;
const ENTER_KEY: u16 = 0x0d;
const NUMPAD_ENTER_KEY: u16 = 0x03;
pub(crate) const ESCAPE_KEY: u16 = 0x1b;
const TAB_KEY: u16 = 0x09;
const SHIFT_TAB_KEY: u16 = 0x19;

// CGPoint/NSPoint equivalent for message returns
#[repr(C)]
struct NSPoint {
    pub x: f64,
    pub y: f64,
}

// Modifier flag masks (from icrate NSEventModifierFlags)
const MOD_CAPS_LOCK: u64 = NSEventModifierFlagCapsLock as u64;
const MOD_SHIFT: u64 = NSEventModifierFlagShift as u64;
const MOD_CONTROL: u64 = NSEventModifierFlagControl as u64;
const MOD_OPTION: u64 = NSEventModifierFlagOption as u64;
const MOD_COMMAND: u64 = NSEventModifierFlagCommand as u64;
const MOD_FUNCTION: u64 = NSEventModifierFlagFunction as u64;

// Event types we care about (from icrate NSEventType)
const ET_LEFT_MOUSE_DOWN: u64 = NSEventTypeLeftMouseDown as u64;
const ET_LEFT_MOUSE_UP: u64 = NSEventTypeLeftMouseUp as u64;
const ET_RIGHT_MOUSE_DOWN: u64 = NSEventTypeRightMouseDown as u64;
const ET_RIGHT_MOUSE_UP: u64 = NSEventTypeRightMouseUp as u64;
const ET_MOUSE_MOVED: u64 = NSEventTypeMouseMoved as u64;
const ET_LEFT_MOUSE_DRAGGED: u64 = NSEventTypeLeftMouseDragged as u64;
const ET_RIGHT_MOUSE_DRAGGED: u64 = NSEventTypeRightMouseDragged as u64;
const ET_MOUSE_EXITED: u64 = NSEventTypeMouseExited as u64;
const ET_KEY_DOWN: u64 = NSEventTypeKeyDown as u64;
const ET_KEY_UP: u64 = NSEventTypeKeyUp as u64;
const ET_FLAGS_CHANGED: u64 = NSEventTypeFlagsChanged as u64;
const ET_SCROLL_WHEEL: u64 = NSEventTypeScrollWheel as u64;
const ET_OTHER_MOUSE_DOWN: u64 = NSEventTypeOtherMouseDown as u64;
const ET_OTHER_MOUSE_UP: u64 = NSEventTypeOtherMouseUp as u64;
const ET_OTHER_MOUSE_DRAGGED: u64 = NSEventTypeOtherMouseDragged as u64;
const ET_SWIPE: u64 = NSEventTypeSwipe as u64;

// Event phases (from icrate NSEventPhase)
const PHASE_BEGAN: u64 = NSEventPhaseBegan as u64;
const PHASE_ENDED: u64 = NSEventPhaseEnded as u64;
const PHASE_MAY_BEGIN: u64 = NSEventPhaseMayBegin as u64;

// Function-key constants used in mapping
const NS_UP_ARROW: u16 = 0xF700;
const NS_DOWN_ARROW: u16 = 0xF701;
const NS_LEFT_ARROW: u16 = 0xF702;
const NS_RIGHT_ARROW: u16 = 0xF703;
const NS_HOME: u16 = 0xF729;
const NS_END: u16 = 0xF72B;
const NS_PAGE_UP: u16 = 0xF72C;
const NS_PAGE_DOWN: u16 = 0xF72D;
const NS_DELETE_FN: u16 = 0xF728;
const NS_HELP_FN: u16 = 0xF746;

pub fn key_to_native(key: &str) -> Cow<'_, str> {
    let code_opt: Option<u16> = match key {
        "space" => Some(SPACE_KEY),
        "backspace" => Some(BACKSPACE_KEY),
        "escape" => Some(ESCAPE_KEY),
        "up" => Some(NS_UP_ARROW),
        "down" => Some(NS_DOWN_ARROW),
        "left" => Some(NS_LEFT_ARROW),
        "right" => Some(NS_RIGHT_ARROW),
        "pageup" => Some(NS_PAGE_UP),
        "pagedown" => Some(NS_PAGE_DOWN),
        "home" => Some(NS_HOME),
        "end" => Some(NS_END),
        "delete" => Some(NS_DELETE_FN),
        "insert" => Some(NS_HELP_FN),
        other if other.len() > 1 && other.starts_with('f') => {
            if let Ok(n) = other[1..].parse::<u16>() {
                if (1..=35).contains(&n) {
                    Some(0xF703 + n)
                } else {
                    None
                }
            } else {
                None
            }
        }
        _ => None,
    };
    if let Some(code) = code_opt {
        Cow::Owned(String::from_utf16(&[code]).unwrap())
    } else {
        Cow::Borrowed(key)
    }
}

unsafe fn read_modifiers(native_event: ObjcId) -> Modifiers {
    let modifiers: u64 = msg_send![native_event, modifierFlags];
    let control = (modifiers & MOD_CONTROL) != 0;
    let alt = (modifiers & MOD_OPTION) != 0;
    let shift = (modifiers & MOD_SHIFT) != 0;
    let command = (modifiers & MOD_COMMAND) != 0;
    let function = (modifiers & MOD_FUNCTION) != 0;

    Modifiers {
        control,
        alt,
        shift,
        platform: command,
        function,
    }
}

impl PlatformInput {
    pub(crate) unsafe fn from_native(
        native_event: ObjcId,
        window_height: Option<Pixels>,
    ) -> Option<Self> {
        let event = native_event as *const NSEvent;
        let event_type: u64 = unsafe { (&*event).r#type() as u64 };

        // Filter out event types that aren't in the NSEventType enum.
        // See https://github.com/servo/cocoa-rs/issues/155#issuecomment-323482792 for details.
        match event_type {
            0 | 21 | 32 | 33 | 35 | 36 | 37 => {
                return None;
            }
            _ => {}
        }

        match event_type {
            ET_FLAGS_CHANGED => Some(Self::ModifiersChanged(ModifiersChangedEvent {
                modifiers: unsafe { read_modifiers(native_event) },
                capslock: Capslock {
                    on: {
                        let m: u64 = unsafe { (&*event).modifierFlags() as u64 };
                        (m & MOD_CAPS_LOCK) != 0
                    },
                },
            })),
            ET_KEY_DOWN => Some(Self::KeyDown(KeyDownEvent {
                keystroke: unsafe { parse_keystroke(native_event) },
                is_held: { unsafe { (&*event).isARepeat() } },
            })),
            ET_KEY_UP => Some(Self::KeyUp(KeyUpEvent {
                keystroke: unsafe { parse_keystroke(native_event) },
            })),
            ET_LEFT_MOUSE_DOWN | ET_RIGHT_MOUSE_DOWN | ET_OTHER_MOUSE_DOWN => {
                let bn: u64 = unsafe { (&*event).buttonNumber() as u64 };
                let button = match bn {
                    0 => MouseButton::Left,
                    1 => MouseButton::Right,
                    2 => MouseButton::Middle,
                    3 => MouseButton::Navigate(NavigationDirection::Back),
                    4 => MouseButton::Navigate(NavigationDirection::Forward),
                    // Other mouse buttons aren't tracked currently
                    _ => return None,
                };
                window_height.map(|window_height| {
                    Self::MouseDown(MouseDownEvent {
                        button,
                        position: {
                            let p: NSPoint = msg_send![native_event, locationInWindow];
                            point(px(p.x as f32), window_height - px(p.y as f32))
                        },
                        modifiers: unsafe { read_modifiers(native_event) },
                        click_count: {
                            let c: isize = unsafe { (&*event).clickCount() };
                            c as usize
                        },
                        first_mouse: false,
                    })
                })
            }
            ET_LEFT_MOUSE_UP | ET_RIGHT_MOUSE_UP | ET_OTHER_MOUSE_UP => {
                let bn: u64 = unsafe { (&*event).buttonNumber() as u64 };
                let button = match bn {
                    0 => MouseButton::Left,
                    1 => MouseButton::Right,
                    2 => MouseButton::Middle,
                    3 => MouseButton::Navigate(NavigationDirection::Back),
                    4 => MouseButton::Navigate(NavigationDirection::Forward),
                    // Other mouse buttons aren't tracked currently
                    _ => return None,
                };

                window_height.map(|window_height| {
                    Self::MouseUp(MouseUpEvent {
                        button,
                        position: {
                            let p = unsafe { (&*event).locationInWindow() };
                            point(px(p.x as f32), window_height - px(p.y as f32))
                        },
                        modifiers: unsafe { read_modifiers(native_event) },
                        click_count: {
                            let c: isize = unsafe { (&*event).clickCount() };
                            c as usize
                        },
                    })
                })
            }
            // Some mice (like Logitech MX Master) send navigation buttons as swipe events
            ET_SWIPE => {
                let phase: u64 = msg_send![native_event, phase];
                let navigation_direction = match phase {
                    PHASE_ENDED => match {
                        let dx: f64 = unsafe { (&*event).deltaX() };
                        dx
                    } {
                        x if x > 0.0 => Some(NavigationDirection::Back),
                        x if x < 0.0 => Some(NavigationDirection::Forward),
                        _ => return None,
                    },
                    _ => return None,
                };

                match navigation_direction {
                    Some(direction) => window_height.map(|window_height| {
                        Self::MouseDown(MouseDownEvent {
                            button: MouseButton::Navigate(direction),
                            position: {
                                let p = unsafe { (&*event).locationInWindow() };
                                point(px(p.x as f32), window_height - px(p.y as f32))
                            },
                            modifiers: unsafe { read_modifiers(native_event) },
                            click_count: 1,
                            first_mouse: false,
                        })
                    }),
                    _ => None,
                }
            }
            ET_SCROLL_WHEEL => window_height.map(|window_height| {
                let phase_val: u64 = unsafe { (&*event).momentumPhase() as u64 };
                let phase = match phase_val {
                    PHASE_MAY_BEGIN | PHASE_BEGAN => TouchPhase::Started,
                    PHASE_ENDED => TouchPhase::Ended,
                    _ => TouchPhase::Moved,
                };

                let raw_data = {
                    let dx: f64 = unsafe { (&*event).scrollingDeltaX() };
                    let dy: f64 = unsafe { (&*event).scrollingDeltaY() };
                    point(dx as f32, dy as f32)
                };

                let precise = unsafe { (&*event).hasPreciseScrollingDeltas() };
                let delta = if precise {
                    ScrollDelta::Pixels(raw_data.map(px))
                } else {
                    ScrollDelta::Lines(raw_data)
                };

                Self::ScrollWheel(ScrollWheelEvent {
                    position: {
                        let p = unsafe { (&*event).locationInWindow() };
                        point(px(p.x as f32), window_height - px(p.y as f32))
                    },
                    delta,
                    touch_phase: phase,
                    modifiers: unsafe { read_modifiers(native_event) },
                })
            }),
            ET_LEFT_MOUSE_DRAGGED | ET_RIGHT_MOUSE_DRAGGED | ET_OTHER_MOUSE_DRAGGED => {
                let bn: u64 = unsafe { (&*event).buttonNumber() as u64 };
                let pressed_button = match bn {
                    0 => MouseButton::Left,
                    1 => MouseButton::Right,
                    2 => MouseButton::Middle,
                    3 => MouseButton::Navigate(NavigationDirection::Back),
                    4 => MouseButton::Navigate(NavigationDirection::Forward),
                    // Other mouse buttons aren't tracked currently
                    _ => return None,
                };

                window_height.map(|window_height| {
                    Self::MouseMove(MouseMoveEvent {
                        pressed_button: Some(pressed_button),
                        position: {
                            let p = unsafe { (&*event).locationInWindow() };
                            point(px(p.x as f32), window_height - px(p.y as f32))
                        },
                        modifiers: unsafe { read_modifiers(native_event) },
                    })
                })
            }
            ET_MOUSE_MOVED => window_height.map(|window_height| {
                Self::MouseMove(MouseMoveEvent {
                    position: {
                        let p = unsafe { (&*event).locationInWindow() };
                        point(px(p.x as f32), window_height - px(p.y as f32))
                    },
                    pressed_button: None,
                    modifiers: unsafe { read_modifiers(native_event) },
                })
            }),
            ET_MOUSE_EXITED => window_height.map(|window_height| {
                Self::MouseExited(MouseExitEvent {
                    position: {
                        let p = unsafe { (&*event).locationInWindow() };
                        point(px(p.x as f32), window_height - px(p.y as f32))
                    },

                    pressed_button: None,
                    modifiers: unsafe { read_modifiers(native_event) },
                })
            }),
            _ => None,
        }
    }
}

unsafe fn parse_keystroke(native_event: ObjcId) -> Keystroke {
    let event = native_event as *const NSEvent;
    // Keep msg_send for charactersIgnoringModifiers for now; bridging Id<NSString>
    // from icrate would add conversion complexity without clear benefit here.
    let cim: ObjcId = msg_send![native_event, charactersIgnoringModifiers];
    let mut characters = unsafe { cim.to_str() }.to_string();
    let mut key_char = None;
    let first_char = characters.chars().next().map(|ch| ch as u16);
    let modifiers: u64 = unsafe { (&*event).modifierFlags() as u64 };

    let control = (modifiers & MOD_CONTROL) != 0;
    let alt = (modifiers & MOD_OPTION) != 0;
    let mut shift = (modifiers & MOD_SHIFT) != 0;
    let command = (modifiers & MOD_COMMAND) != 0;
    let function = (modifiers & MOD_FUNCTION) != 0
        && first_char.is_none_or(|ch| !(0xF700..=0xF8FF).contains(&ch));

    #[allow(non_upper_case_globals)]
    let key = match first_char {
        Some(SPACE_KEY) => {
            key_char = Some(" ".to_string());
            "space".to_string()
        }
        Some(TAB_KEY) => {
            key_char = Some("\t".to_string());
            "tab".to_string()
        }
        Some(ENTER_KEY) | Some(NUMPAD_ENTER_KEY) => {
            key_char = Some("\n".to_string());
            "enter".to_string()
        }
        Some(BACKSPACE_KEY) => "backspace".to_string(),
        Some(ESCAPE_KEY) => "escape".to_string(),
        Some(SHIFT_TAB_KEY) => "tab".to_string(),
        Some(NS_UP_ARROW) => "up".to_string(),
        Some(NS_DOWN_ARROW) => "down".to_string(),
        Some(NS_LEFT_ARROW) => "left".to_string(),
        Some(NS_RIGHT_ARROW) => "right".to_string(),
        Some(NS_PAGE_UP) => "pageup".to_string(),
        Some(NS_PAGE_DOWN) => "pagedown".to_string(),
        Some(NS_HOME) => "home".to_string(),
        Some(NS_END) => "end".to_string(),
        Some(NS_DELETE_FN) => "delete".to_string(),
        // Observed Insert==NSHelpFunctionKey not NSInsertFunctionKey.
        Some(NS_HELP_FN) => "insert".to_string(),
        Some(fc) if (0xF704..=0xF726).contains(&fc) => {
            let n = fc - 0xF703u16;
            format!("f{}", n)
        }
        _ => {
            // Cases to test when modifying this:
            //
            //           qwerty key | none | cmd   | cmd-shift
            // * Armenian         s | ս    | cmd-s | cmd-shift-s  (layout is non-ASCII, so we use cmd layout)
            // * Dvorak+QWERTY    s | o    | cmd-s | cmd-shift-s  (layout switches on cmd)
            // * Ukrainian+QWERTY s | с    | cmd-s | cmd-shift-s  (macOS reports cmd-s instead of cmd-S)
            // * Czech            7 | ý    | cmd-ý | cmd-7        (layout has shifted numbers)
            // * Norwegian        7 | 7    | cmd-7 | cmd-/        (macOS reports cmd-shift-7 instead of cmd-/)
            // * Russian          7 | 7    | cmd-7 | cmd-&        (shift-7 is . but when cmd is down, should use cmd layout)
            // * German QWERTZ    ; | ö    | cmd-ö | cmd-Ö        (Zed's shift special case only applies to a-z)
            //
            let key_code: u16 = unsafe { (&*event).keyCode() };
            let mut chars_ignoring_modifiers = chars_for_modified_key(key_code, NO_MOD);
            let mut chars_with_shift = chars_for_modified_key(key_code, SHIFT_MOD);
            let always_use_cmd_layout = always_use_command_layout();

            // Handle Dvorak+QWERTY / Russian / Armenian
            if command || always_use_cmd_layout {
                let chars_with_cmd = chars_for_modified_key(key_code, CMD_MOD);
                let chars_with_both = chars_for_modified_key(key_code, CMD_MOD | SHIFT_MOD);

                // We don't do this in the case that the shifted command key generates
                // the same character as the unshifted command key (Norwegian, e.g.)
                if chars_with_both != chars_with_cmd {
                    chars_with_shift = chars_with_both;

                // Handle edge-case where cmd-shift-s reports cmd-s instead of
                // cmd-shift-s (Ukrainian, etc.)
                } else if chars_with_cmd.to_ascii_uppercase() != chars_with_cmd {
                    chars_with_shift = chars_with_cmd.to_ascii_uppercase();
                }
                chars_ignoring_modifiers = chars_with_cmd;
            }

            if !control && !command && !function {
                let mut mods = NO_MOD;
                if shift {
                    mods |= SHIFT_MOD;
                }
                if alt {
                    mods |= OPTION_MOD;
                }

                key_char = Some(chars_for_modified_key(key_code, mods));
            }

            if shift
                && chars_ignoring_modifiers
                    .chars()
                    .all(|c| c.is_ascii_lowercase())
            {
                chars_ignoring_modifiers
            } else if shift {
                shift = false;
                chars_with_shift
            } else {
                chars_ignoring_modifiers
            }
        }
    };

    Keystroke {
        modifiers: Modifiers {
            control,
            alt,
            shift,
            platform: command,
            function,
        },
        key,
        key_char,
    }
}

fn always_use_command_layout() -> bool {
    if chars_for_modified_key(0, NO_MOD).is_ascii() {
        return false;
    }

    chars_for_modified_key(0, CMD_MOD).is_ascii()
}

const NO_MOD: u32 = 0;
const CMD_MOD: u32 = 1;
const SHIFT_MOD: u32 = 2;
const OPTION_MOD: u32 = 8;

fn chars_for_modified_key(code: CGKeyCode, modifiers: u32) -> String {
    // Values from: https://github.com/phracker/MacOSX-SDKs/blob/master/MacOSX10.6.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h#L126
    // shifted >> 8 for UCKeyTranslate
    const CG_SPACE_KEY: u16 = 49;
    // https://github.com/phracker/MacOSX-SDKs/blob/master/MacOSX10.6.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/UnicodeUtilities.h#L278
    #[allow(non_upper_case_globals)]
    const kUCKeyActionDown: u16 = 0;
    #[allow(non_upper_case_globals)]
    const kUCKeyTranslateNoDeadKeysMask: u32 = 0;

    let keyboard_type = unsafe { LMGetKbdType() as u32 };
    const BUFFER_SIZE: usize = 4;
    let mut dead_key_state = 0;
    let mut buffer: [u16; BUFFER_SIZE] = [0; BUFFER_SIZE];
    let mut buffer_size: usize = 0;

    let keyboard = unsafe { TISCopyCurrentKeyboardLayoutInputSource() };
    if keyboard.is_null() {
        return "".to_string();
    }
    let layout_data = unsafe {
        TISGetInputSourceProperty(keyboard, kTISPropertyUnicodeKeyLayoutData as *const c_void)
            as CFDataRef
    };
    if layout_data.is_null() {
        unsafe {
            let _: () = msg_send![keyboard, release];
        }
        return "".to_string();
    }
    let keyboard_layout = unsafe { CFDataGetBytePtr(layout_data) };

    unsafe {
        UCKeyTranslate(
            keyboard_layout as *const c_void,
            code,
            kUCKeyActionDown,
            modifiers,
            keyboard_type,
            kUCKeyTranslateNoDeadKeysMask,
            &mut dead_key_state,
            BUFFER_SIZE,
            &mut buffer_size as *mut usize,
            &mut buffer as *mut u16,
        );
        if dead_key_state != 0 {
            UCKeyTranslate(
                keyboard_layout as *const c_void,
                CG_SPACE_KEY,
                kUCKeyActionDown,
                modifiers,
                keyboard_type,
                kUCKeyTranslateNoDeadKeysMask,
                &mut dead_key_state,
                BUFFER_SIZE,
                &mut buffer_size as *mut usize,
                &mut buffer as *mut u16,
            );
        }
        let _: () = msg_send![keyboard, release];
    }
    String::from_utf16(&buffer[..buffer_size]).unwrap_or_default()
}
