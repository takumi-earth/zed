use crate::WindowAppearance;
use icrate::AppKit::{
    NSAppearanceNameAqua, NSAppearanceNameDarkAqua, NSAppearanceNameVibrantDark,
    NSAppearanceNameVibrantLight,
};
use objc::runtime::Object;
use objc::{msg_send, sel, sel_impl};

impl WindowAppearance {
    pub(crate) unsafe fn from_native(appearance: *mut Object) -> Self {
        let name: *mut Object = unsafe { msg_send![appearance, name] };
        if unsafe { name == (NSAppearanceNameVibrantLight as *const _ as *mut Object) } {
            Self::VibrantLight
        } else if unsafe { name == (NSAppearanceNameVibrantDark as *const _ as *mut Object) } {
            Self::VibrantDark
        } else if unsafe { name == (NSAppearanceNameAqua as *const _ as *mut Object) } {
            Self::Light
        } else if unsafe { name == (NSAppearanceNameDarkAqua as *const _ as *mut Object) } {
            Self::Dark
        } else {
            Self::Light
        }
    }
}
