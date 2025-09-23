# <start summary of warnings and errors>

warning: `fs` (lib) generated 14 warnings
warning: `gpui` (lib) generated 1245 warnings
error: could not compile `jupyter-websocket-client` (lib) due to 2 errors
For more information about this error, try `rustc --explain E0432`.
warning: `client` (lib) generated 8 warnings

# </end summary of warnings and errors>

# <start details of errors>

error[E0432]: unresolved import `async_tungstenite::tokio`
  --> /Users/takumi/.cargo/git/checkouts/runtimed-da41b1ee8fc7914c/7130c80/crates/jupyter-websocket-client/src/client.rs:3:5
   |
3  |     tokio::connect_async,
   |     ^^^^^ could not find `tokio` in `async_tungstenite`
   |
note: found an item that was configured out
  --> /Users/takumi/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/async-tungstenite-0.31.0/src/lib.rs:94:9
   |
94 | pub mod tokio;
   |         ^^^^^
note: the item is gated behind the `tokio-runtime` feature
  --> /Users/takumi/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/async-tungstenite-0.31.0/src/lib.rs:93:7
   |
93 | #[cfg(feature = "tokio-runtime")]
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^

error[E0432]: unresolved import `async_tungstenite::tokio`
  --> /Users/takumi/.cargo/git/checkouts/runtimed-da41b1ee8fc7914c/7130c80/crates/jupyter-websocket-client/src/websocket.rs:2:25
   |
2  | use async_tungstenite::{tokio::ConnectStream, tungstenite::Message, WebSocketStream};
   |                         ^^^^^ could not find `tokio` in `async_tungstenite`
   |
note: found an item that was configured out
  --> /Users/takumi/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/async-tungstenite-0.31.0/src/lib.rs:94:9
   |
94 | pub mod tokio;
   |         ^^^^^
note: the item is gated behind the `tokio-runtime` feature
  --> /Users/takumi/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/async-tungstenite-0.31.0/src/lib.rs:93:7
   |
93 | #[cfg(feature = "tokio-runtime")]
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^

# </end details of errors>

# <start details of warnings>

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac.rs:38:12
   |
38 |     base::{id, nil},
   |            ^^
   |
   = note: `#[warn(deprecated)]` on by default

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac.rs:38:16
   |
38 |     base::{id, nil},
   |                ^^^

warning: use of deprecated trait `cocoa::foundation::NSAutoreleasePool`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:18
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                  ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::foundation::NSNotFound`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:37
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                                     ^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:49
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                                                 ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:57
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                                                         ^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:65
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                                                                 ^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:39:75
   |
39 |     foundation::{NSAutoreleasePool, NSNotFound, NSRect, NSSize, NSString, NSUInteger},
   |                                                                           ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac.rs:75:22
   |
75 | impl NSStringExt for id {
   |                      ^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:91:19
   |
91 |     pub location: NSUInteger,
   |                   ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:92:17
   |
92 |     pub length: NSUInteger,
   |                 ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac.rs:138:38
    |
138 | unsafe fn ns_string(string: &str) -> id {
    |                                      ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:139:24
    |
139 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                        ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac.rs:139:30
    |
139 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                              ^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:142:11
    |
142 | impl From<NSSize> for Size<Pixels> {
    |           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:151:11
    |
151 | impl From<NSRect> for Size<Pixels> {
    |           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:158:11
    |
158 | impl From<NSRect> for Size<DevicePixels> {
    |           ^^^^^^

warning: use of deprecated constant `cocoa::foundation::NSNotFound`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:98:23
   |
98 |             location: NSNotFound as NSUInteger,
   |                       ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:98:37
   |
98 |             location: NSNotFound as NSUInteger,
   |                                     ^^^^^^^^^^

warning: use of deprecated constant `cocoa::foundation::NSNotFound`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:104:26
    |
104 |         self.location != NSNotFound as NSUInteger
    |                          ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:104:40
    |
104 |         self.location != NSNotFound as NSUInteger
    |                                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:121:38
    |
121 |             location: range.start as NSUInteger,
    |                                      ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:122:36
    |
122 |             length: range.len() as NSUInteger,
    |                                    ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:131:13
    |
131 |             NSUInteger::encode().as_str(),
    |             ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:132:13
    |
132 |             NSUInteger::encode().as_str()
    |             ^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:143:20
    |
143 |     fn from(value: NSSize) -> Self {
    |                    ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:152:19
    |
152 |     fn from(rect: NSRect) -> Self {
    |                   ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:153:13
    |
153 |         let NSSize { width, height } = rect.size;
    |             ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:159:19
    |
159 |     fn from(rect: NSRect) -> Self {
    |                   ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:160:13
    |
160 |         let NSSize { width, height } = rect.size;
    |             ^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSScreen`: use the objc2-app-kit crate instead
 --> crates/gpui/src/platform/mac/display.rs:4:13
  |
4 |     appkit::NSScreen,
  |             ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/display.rs:5:12
  |
5 |     base::{id, nil},
  |            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/display.rs:5:16
  |
5 |     base::{id, nil},
  |                ^^^

warning: use of deprecated trait `cocoa::foundation::NSDictionary`: use the objc2-foundation crate instead
 --> crates/gpui/src/platform/mac/display.rs:6:18
  |
6 |     foundation::{NSDictionary, NSString},
  |                  ^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
 --> crates/gpui/src/platform/mac/display.rs:6:32
  |
6 |     foundation::{NSDictionary, NSString},
  |                                ^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSScreen::screens`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/display.rs:35:37
   |
35 |             let screens = NSScreen::screens(nil);
   |                                     ^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/display.rs:35:45
   |
35 |             let screens = NSScreen::screens(nil);
   |                                             ^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/display.rs:36:54
   |
36 |             let screen = cocoa::foundation::NSArray::objectAtIndex(screens, 0);
   |                                                      ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSScreen::deviceDescription`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/display.rs:37:48
   |
37 |             let device_description = NSScreen::deviceDescription(screen);
   |                                                ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/display.rs:38:51
   |
38 |             let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
   |                                                   ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/display.rs:38:57
   |
38 |             let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
   |                                                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/display.rs:38:36
   |
38 |             let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
   |                                    ^^

warning: use of deprecated trait `cocoa::appkit::NSEvent`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:12:14
   |
12 |     appkit::{NSEvent, NSEventModifierFlags, NSEventPhase, NSEventType},
   |              ^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:12:23
   |
12 |     appkit::{NSEvent, NSEventModifierFlags, NSEventPhase, NSEventType},
   |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventPhase`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:12:45
   |
12 |     appkit::{NSEvent, NSEventModifierFlags, NSEventPhase, NSEventType},
   |                                             ^^^^^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSEventType`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:12:59
   |
12 |     appkit::{NSEvent, NSEventModifierFlags, NSEventPhase, NSEventType},
   |                                                           ^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/events.rs:13:17
   |
13 |     base::{YES, id},
   |                 ^^

warning: use of deprecated constant `cocoa::appkit::NSUpArrowFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:34:17
   |
34 |         "up" => NSUpArrowFunctionKey,
   |                 ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSDownArrowFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:35:19
   |
35 |         "down" => NSDownArrowFunctionKey,
   |                   ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSLeftArrowFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:36:19
   |
36 |         "left" => NSLeftArrowFunctionKey,
   |                   ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSRightArrowFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:37:20
   |
37 |         "right" => NSRightArrowFunctionKey,
   |                    ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSPageUpFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:38:21
   |
38 |         "pageup" => NSPageUpFunctionKey,
   |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSPageDownFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:39:23
   |
39 |         "pagedown" => NSPageDownFunctionKey,
   |                       ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSHomeFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:40:19
   |
40 |         "home" => NSHomeFunctionKey,
   |                   ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSEndFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:41:18
   |
41 |         "end" => NSEndFunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSDeleteFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:42:21
   |
42 |         "delete" => NSDeleteFunctionKey,
   |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSHelpFunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:43:21
   |
43 |         "insert" => NSHelpFunctionKey,
   |                     ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF1FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:44:17
   |
44 |         "f1" => NSF1FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF2FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:45:17
   |
45 |         "f2" => NSF2FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF3FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:46:17
   |
46 |         "f3" => NSF3FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF4FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:47:17
   |
47 |         "f4" => NSF4FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF5FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:48:17
   |
48 |         "f5" => NSF5FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF6FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:49:17
   |
49 |         "f6" => NSF6FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF7FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:50:17
   |
50 |         "f7" => NSF7FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF8FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:51:17
   |
51 |         "f8" => NSF8FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF9FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:52:17
   |
52 |         "f9" => NSF9FunctionKey,
   |                 ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF10FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:53:18
   |
53 |         "f10" => NSF10FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF11FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:54:18
   |
54 |         "f11" => NSF11FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF12FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:55:18
   |
55 |         "f12" => NSF12FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF13FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:56:18
   |
56 |         "f13" => NSF13FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF14FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:57:18
   |
57 |         "f14" => NSF14FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF15FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:58:18
   |
58 |         "f15" => NSF15FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF16FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:59:18
   |
59 |         "f16" => NSF16FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF17FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:60:18
   |
60 |         "f17" => NSF17FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF18FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:61:18
   |
61 |         "f18" => NSF18FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF19FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:62:18
   |
62 |         "f19" => NSF19FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF20FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:63:18
   |
63 |         "f20" => NSF20FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF21FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:64:18
   |
64 |         "f21" => NSF21FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF22FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:65:18
   |
65 |         "f22" => NSF22FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF23FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:66:18
   |
66 |         "f23" => NSF23FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF24FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:67:18
   |
67 |         "f24" => NSF24FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF25FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:68:18
   |
68 |         "f25" => NSF25FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF26FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:69:18
   |
69 |         "f26" => NSF26FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF27FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:70:18
   |
70 |         "f27" => NSF27FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF28FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:71:18
   |
71 |         "f28" => NSF28FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF29FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:72:18
   |
72 |         "f29" => NSF29FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF30FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:73:18
   |
73 |         "f30" => NSF30FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF31FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:74:18
   |
74 |         "f31" => NSF31FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF32FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:75:18
   |
75 |         "f32" => NSF32FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF33FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:76:18
   |
76 |         "f33" => NSF33FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF34FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:77:18
   |
77 |         "f34" => NSF34FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF35FunctionKey`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:78:18
   |
78 |         "f35" => NSF35FunctionKey,
   |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated module `cocoa::appkit`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:29:16
   |
29 |     use cocoa::appkit::*;
   |                ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/events.rs:84:40
   |
84 | unsafe fn read_modifiers(native_event: id) -> Modifiers {
   |                                        ^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:87:42
   |
87 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
   |                                          ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:88:38
   |
88 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
   |                                      ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:89:40
   |
89 |         let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
   |                                        ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:90:42
   |
90 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
   |                                          ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:91:43
   |
91 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
   |                                           ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/events.rs:297:41
    |
297 | unsafe fn parse_keystroke(native_event: id) -> Keystroke {
    |                                         ^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:309:42
    |
309 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
    |                                          ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:310:38
    |
310 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
    |                                      ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:311:44
    |
311 |         let mut shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
    |                                            ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:312:42
    |
312 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
    |                                          ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:313:43
    |
313 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask)
    |                                           ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSUpArrowFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:315:36
    |
315 |                 .is_none_or(|ch| !(NSUpArrowFunctionKey..=NSModeSwitchFunctionKey).contains(&ch));
    |                                    ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSModeSwitchFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:315:59
    |
315 |                 .is_none_or(|ch| !(NSUpArrowFunctionKey..=NSModeSwitchFunctionKey).contains(&ch));
    |                                                           ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSUpArrowFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:334:18
    |
334 |             Some(NSUpArrowFunctionKey) => "up".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSDownArrowFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:335:18
    |
335 |             Some(NSDownArrowFunctionKey) => "down".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSLeftArrowFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:336:18
    |
336 |             Some(NSLeftArrowFunctionKey) => "left".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSRightArrowFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:337:18
    |
337 |             Some(NSRightArrowFunctionKey) => "right".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSPageUpFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:338:18
    |
338 |             Some(NSPageUpFunctionKey) => "pageup".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSPageDownFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:339:18
    |
339 |             Some(NSPageDownFunctionKey) => "pagedown".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSHomeFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:340:18
    |
340 |             Some(NSHomeFunctionKey) => "home".to_string(),
    |                  ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSEndFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:341:18
    |
341 |             Some(NSEndFunctionKey) => "end".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSDeleteFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:342:18
    |
342 |             Some(NSDeleteFunctionKey) => "delete".to_string(),
    |                  ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSHelpFunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:344:18
    |
344 |             Some(NSHelpFunctionKey) => "insert".to_string(),
    |                  ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF1FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:345:18
    |
345 |             Some(NSF1FunctionKey) => "f1".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF2FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:346:18
    |
346 |             Some(NSF2FunctionKey) => "f2".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF3FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:347:18
    |
347 |             Some(NSF3FunctionKey) => "f3".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF4FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:348:18
    |
348 |             Some(NSF4FunctionKey) => "f4".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF5FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:349:18
    |
349 |             Some(NSF5FunctionKey) => "f5".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF6FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:350:18
    |
350 |             Some(NSF6FunctionKey) => "f6".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF7FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:351:18
    |
351 |             Some(NSF7FunctionKey) => "f7".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF8FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:352:18
    |
352 |             Some(NSF8FunctionKey) => "f8".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF9FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:353:18
    |
353 |             Some(NSF9FunctionKey) => "f9".to_string(),
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF10FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:354:18
    |
354 |             Some(NSF10FunctionKey) => "f10".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF11FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:355:18
    |
355 |             Some(NSF11FunctionKey) => "f11".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF12FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:356:18
    |
356 |             Some(NSF12FunctionKey) => "f12".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF13FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:357:18
    |
357 |             Some(NSF13FunctionKey) => "f13".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF14FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:358:18
    |
358 |             Some(NSF14FunctionKey) => "f14".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF15FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:359:18
    |
359 |             Some(NSF15FunctionKey) => "f15".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF16FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:360:18
    |
360 |             Some(NSF16FunctionKey) => "f16".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF17FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:361:18
    |
361 |             Some(NSF17FunctionKey) => "f17".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF18FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:362:18
    |
362 |             Some(NSF18FunctionKey) => "f18".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF19FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:363:18
    |
363 |             Some(NSF19FunctionKey) => "f19".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF20FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:364:18
    |
364 |             Some(NSF20FunctionKey) => "f20".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF21FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:365:18
    |
365 |             Some(NSF21FunctionKey) => "f21".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF22FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:366:18
    |
366 |             Some(NSF22FunctionKey) => "f22".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF23FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:367:18
    |
367 |             Some(NSF23FunctionKey) => "f23".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF24FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:368:18
    |
368 |             Some(NSF24FunctionKey) => "f24".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF25FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:369:18
    |
369 |             Some(NSF25FunctionKey) => "f25".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF26FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:370:18
    |
370 |             Some(NSF26FunctionKey) => "f26".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF27FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:371:18
    |
371 |             Some(NSF27FunctionKey) => "f27".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF28FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:372:18
    |
372 |             Some(NSF28FunctionKey) => "f28".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF29FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:373:18
    |
373 |             Some(NSF29FunctionKey) => "f29".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF30FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:374:18
    |
374 |             Some(NSF30FunctionKey) => "f30".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF31FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:375:18
    |
375 |             Some(NSF31FunctionKey) => "f31".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF32FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:376:18
    |
376 |             Some(NSF32FunctionKey) => "f32".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF33FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:377:18
    |
377 |             Some(NSF33FunctionKey) => "f33".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF34FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:378:18
    |
378 |             Some(NSF34FunctionKey) => "f34".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSF35FunctionKey`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:379:18
    |
379 |             Some(NSF35FunctionKey) => "f35".to_string(),
    |                  ^^^^^^^^^^^^^^^^

warning: use of deprecated module `cocoa::appkit`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:299:20
    |
299 |         use cocoa::appkit::*;
    |                    ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/events.rs:105:23
    |
105 |         native_event: id,
    |                       ^^

warning: use of deprecated unit variant `cocoa::appkit::NSFlagsChanged`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:121:30
    |
121 |                 NSEventType::NSFlagsChanged => {
    |                              ^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:127:43
    |
127 | ...                   .contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
    |                                 ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSKeyDown`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:131:30
    |
131 |                 NSEventType::NSKeyDown => Some(Self::KeyDown(KeyDownEvent {
    |                              ^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSKeyUp`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:135:30
    |
135 |                 NSEventType::NSKeyUp => Some(Self::KeyUp(KeyUpEvent {
    |                              ^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSLeftMouseDown`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:138:30
    |
138 |                 NSEventType::NSLeftMouseDown
    |                              ^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSRightMouseDown`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:139:32
    |
139 |                 | NSEventType::NSRightMouseDown
    |                                ^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSOtherMouseDown`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:140:32
    |
140 |                 | NSEventType::NSOtherMouseDown => {
    |                                ^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSLeftMouseUp`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:164:30
    |
164 |                 NSEventType::NSLeftMouseUp
    |                              ^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSRightMouseUp`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:165:32
    |
165 |                 | NSEventType::NSRightMouseUp
    |                                ^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSOtherMouseUp`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:166:32
    |
166 |                 | NSEventType::NSOtherMouseUp => {
    |                                ^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSEventTypeSwipe`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:190:30
    |
190 |                 NSEventType::NSEventTypeSwipe => {
    |                              ^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventPhase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:192:25
    |
192 |                         NSEventPhase::NSEventPhaseEnded => match native_event.deltaX() {
    |                         ^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSScrollWheel`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:216:30
    |
216 |                 NSEventType::NSScrollWheel => window_height.map(|window_height| {
    |                              ^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventPhase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:218:25
    |
218 |                         NSEventPhase::NSEventPhaseMayBegin | NSEventPhase::NSEventPhaseBegan => {
    |                         ^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventPhase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:218:62
    |
218 |                         NSEventPhase::NSEventPhaseMayBegin | NSEventPhase::NSEventPhaseBegan => {
    |                                                              ^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventPhase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:221:25
    |
221 |                         NSEventPhase::NSEventPhaseEnded => TouchPhase::Ended,
    |                         ^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSLeftMouseDragged`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:246:30
    |
246 |                 NSEventType::NSLeftMouseDragged
    |                              ^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSRightMouseDragged`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:247:32
    |
247 |                 | NSEventType::NSRightMouseDragged
    |                                ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSOtherMouseDragged`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:248:32
    |
248 |                 | NSEventType::NSOtherMouseDragged => {
    |                                ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSMouseMoved`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:270:30
    |
270 |                 NSEventType::NSMouseMoved => window_height.map(|window_height| {
    |                              ^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSMouseExited`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:280:30
    |
280 |                 NSEventType::NSMouseExited => window_height.map(|window_height| {
    |                              ^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/screen_capture.rs:9:17
  |
9 |     base::{YES, id, nil},
  |                 ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/screen_capture.rs:9:21
  |
9 |     base::{YES, id, nil},
  |                     ^^^

warning: use of deprecated trait `cocoa::foundation::NSArray`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:10:18
   |
10 |     foundation::{NSArray, NSString},
   |                  ^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:10:27
   |
10 |     foundation::{NSArray, NSString},
   |                           ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:35:17
   |
35 |     sc_display: id,
   |                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:40:16
   |
40 |     sc_stream: id,
   |                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:41:23
   |
41 |     sc_stream_output: id,
   |                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:195:18
    |
195 |     let screens: id = msg_send![class!(NSScreen), screens];
    |                  ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:198:48
    |
198 |     let screen_number_key = unsafe { NSString::alloc(nil).init_str("NSScreenNumber") };
    |                                                ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:198:54
    |
198 |     let screen_number_key = unsafe { NSString::alloc(nil).init_str("NSScreenNumber") };
    |                                                      ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:200:21
    |
200 |         let screen: id = msg_send![screens, objectAtIndex: i];
    |                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:201:26
    |
201 |         let device_desc: id = msg_send![screen, deviceDescription];
    |                          ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:202:27
    |
202 |         if device_desc == nil {
    |                           ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:206:23
    |
206 |         let nsnumber: id = msg_send![device_desc, objectForKey: screen_number_key];
    |                       ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:207:24
    |
207 |         if nsnumber == nil {
    |                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:213:19
    |
213 |         let name: id = msg_send![screen, localizedName];
    |                   ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:214:20
    |
214 |         if name != nil {
    |                    ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:238:65
    |
238 |         let block = ConcreteBlock::new(move |shareable_content: id, error: id| {
    |                                                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:238:76
    |
238 |         let block = ConcreteBlock::new(move |shareable_content: id, error: id| {
    |                                                                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:243:38
    |
243 |             let result = if error == nil {
    |                                      ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:244:31
    |
244 |                 let displays: id = msg_send![shareable_content, displays];
    |                               ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:258:26
    |
258 |                 let msg: id = msg_send![error, localizedDescription];
    |                          ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:283:85
    |
283 |             output_video_effect_did_start_for_stream as extern "C" fn(&Object, Sel, id),
    |                                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:287:84
    |
287 |             output_video_effect_did_stop_for_stream as extern "C" fn(&Object, Sel, id),
    |                                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:291:71
    |
291 |             stream_did_stop_with_error as extern "C" fn(&Object, Sel, id, id),
    |                                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:291:75
    |
291 |             stream_did_stop_with_error as extern "C" fn(&Object, Sel, id, id),
    |                                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:299:48
    |
299 |                 as extern "C" fn(&Object, Sel, id, id, NSInteger),
    |                                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:299:52
    |
299 |                 as extern "C" fn(&Object, Sel, id, id, NSInteger),
    |                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:307:89
    |
307 | extern "C" fn output_video_effect_did_start_for_stream(_this: &Object, _: Sel, _stream: id) {}
    |                                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:309:88
    |
309 | extern "C" fn output_video_effect_did_stop_for_stream(_this: &Object, _: Sel, _stream: id) {}
    |                                                                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:311:75
    |
311 | extern "C" fn stream_did_stop_with_error(_this: &Object, _: Sel, _stream: id, _error: id) {}
    |                                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:311:87
    |
311 | extern "C" fn stream_did_stop_with_error(_this: &Object, _: Sel, _stream: id, _error: id) {}
    |                                                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:316:14
    |
316 |     _stream: id,
    |              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:317:20
    |
317 |     sample_buffer: id,
    |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:86:25
   |
86 |             let stream: id = msg_send![class!(SCStream), alloc];
   |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:87:25
   |
87 |             let filter: id = msg_send![class!(SCContentFilter), alloc];
   |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:88:32
   |
88 |             let configuration: id = msg_send![class!(SCStreamConfiguration), alloc];
   |                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:89:27
   |
89 |             let delegate: id = msg_send![DELEGATE_CLASS, alloc];
   |                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:90:25
   |
90 |             let output: id = msg_send![OUTPUT_CLASS, alloc];
   |                         ^^

warning: use of deprecated associated function `cocoa::foundation::NSArray::array`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:92:45
   |
92 |             let excluded_windows = NSArray::array(nil);
   |                                             ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:92:51
   |
92 |             let excluded_windows = NSArray::array(nil);
   |                                                   ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:93:25
   |
93 |             let filter: id = msg_send![filter, initWithDisplay:self.sc_display excludingWindows:excluded_windows];
   |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:94:32
   |
94 |             let configuration: id = msg_send![configuration, init];
   |                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:95:20
   |
95 |             let _: id = msg_send![configuration, setScalesToFit: true];
   |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:96:20
   |
96 |             let _: id = msg_send![configuration, setPixelFormat: 0x42475241];
   |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/screen_capture.rs:99:27
   |
99 |             let delegate: id = msg_send![delegate, init];
   |                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:100:25
    |
100 |             let output: id = msg_send![output, init];
    |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:108:20
    |
108 |             let _: id = msg_send![configuration, setWidth: meta.resolution.width.0 as i64];
    |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:109:20
    |
109 |             let _: id = msg_send![configuration, setHeight: meta.resolution.height.0 as i64];
    |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:110:25
    |
110 |             let stream: id = msg_send![stream, initWithFilter:filter configuration:configuration delegate:delegate];
    |                         ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:114:33
    |
114 |             let mut error: id = nil;
    |                                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:114:28
    |
114 |             let mut error: id = nil;
    |                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:115:142
    |
115 | ...utputTypeScreen sampleHandlerQueue:0 error:&mut error as *mut id];
    |                                                                  ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:116:25
    |
116 |             if error != nil {
    |                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:117:30
    |
117 |                 let message: id = msg_send![error, localizedDescription];
    |                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:125:30
    |
125 |                 move |error: id| {
    |                              ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:126:46
    |
126 |                     let result = if error == nil {
    |                                              ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:134:38
    |
134 |                         let message: id = msg_send![error, localizedDescription];
    |                                      ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:166:33
    |
166 |             let mut error: id = nil;
    |                                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:166:28
    |
166 |             let mut error: id = nil;
    |                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:168:25
    |
168 |             if error != nil {
    |                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:169:30
    |
169 |                 let message: id = msg_send![error, localizedDescription];
    |                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:173:59
    |
173 |             let handler = ConcreteBlock::new(move |error: id| {
    |                                                           ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:174:29
    |
174 |                 if error != nil {
    |                             ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:175:34
    |
175 |                     let message: id = msg_send![error, localizedDescription];
    |                                  ^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/metal_renderer.rs:11:18
   |
11 |     foundation::{NSSize, NSUInteger},
   |                  ^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/metal_renderer.rs:11:26
   |
11 |     foundation::{NSSize, NSUInteger},
   |                          ^^^^^^^^^^

warning: use of deprecated struct `cocoa::quartzcore::AutoresizingMask`: use the objc2-quartz-core crate instead
  --> crates/gpui/src/platform/mac/metal_renderer.rs:12:17
   |
12 |     quartzcore::AutoresizingMask,
   |                 ^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::quartzcore::AutoresizingMask`: use the objc2-quartz-core crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:152:38
    |
152 |                 setAutoresizingMask: AutoresizingMask::WIDTH_SIZABLE
    |                                      ^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::quartzcore::AutoresizingMask`: use the objc2-quartz-core crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:153:23
    |
153 |                     | AutoresizingMask::HEIGHT_SIZABLE
    |                       ^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:299:20
    |
299 |         let size = NSSize {
    |                    ^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:545:40
    |
545 |             length: instance_offset as NSUInteger,
    |                                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/attributed_string.rs:1:18
  |
1 | use cocoa::base::id;
  |                  ^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
 --> crates/gpui/src/platform/mac/attributed_string.rs:2:24
  |
2 | use cocoa::foundation::NSRange;
  |                        ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:21:29
   |
21 | impl NSAttributedString for id {
   |                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:49:36
   |
49 | impl NSMutableAttributedString for id {}
   |                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:10:33
   |
10 |     unsafe fn alloc(_: Self) -> id {
   |                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:14:52
   |
14 |     unsafe fn init_attributed_string(self, string: id) -> id;
   |                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:14:59
   |
14 |     unsafe fn init_attributed_string(self, string: id) -> id;
   |                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:15:58
   |
15 |     unsafe fn appendAttributedString_(self, attr_string: id);
   |                                                          ^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:16:62
   |
16 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                              ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:16:78
   |
16 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:16:85
   |
16 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                                                     ^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:17:61
   |
17 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                             ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:17:77
   |
17 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:17:84
   |
17 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id;
   |                                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:18:31
   |
18 |     unsafe fn string(self) -> id;
   |                               ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:44:33
   |
44 |     unsafe fn alloc(_: Self) -> id {
   |                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:22:52
   |
22 |     unsafe fn init_attributed_string(self, string: id) -> id {
   |                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:22:59
   |
22 |     unsafe fn init_attributed_string(self, string: id) -> id {
   |                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:26:58
   |
26 |     unsafe fn appendAttributedString_(self, attr_string: id) {
   |                                                          ^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:30:62
   |
30 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                              ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:30:78
   |
30 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:30:85
   |
30 |     unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                                                     ^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:34:61
   |
34 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                             ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:34:77
   |
34 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:34:84
   |
34 |     unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: id) -> id {
   |                                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/attributed_string.rs:38:31
   |
38 |     unsafe fn string(self) -> id {
   |                               ^^

warning: use of deprecated trait `cocoa::appkit::NSApplication`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:19:9
   |
19 |         NSApplication, NSApplicationActivationPolicy::NSApplicationActivationPolicyRegular,
   |         ^^^^^^^^^^^^^

warning: use of deprecated variant `cocoa::appkit::NSApplicationActivationPolicyRegular`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:19:55
   |
19 |         NSApplication, NSApplicationActivationPolicy::NSApplicationActivationPolicyRegular,
   |                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSApplicationActivationPolicyRegular`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:19:55
   |
19 |         NSApplication, NSApplicationActivationPolicy::NSApplicationActivationPolicyRegular,
   |                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:9
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |         ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSMenu`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:31
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |                               ^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSMenuItem`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:39
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |                                       ^^^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSModalResponse`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:51
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |                                                   ^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSOpenPanel`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:68
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |                                                                    ^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSPasteboard`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:20:81
   |
20 |         NSEventModifierFlags, NSMenu, NSMenuItem, NSModalResponse, NSOpenPanel, NSPasteboard,
   |                                                                                 ^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypePNG`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:21:9
   |
21 |         NSPasteboardTypePNG, NSPasteboardTypeRTF, NSPasteboardTypeRTFD, NSPasteboardTypeString,
   |         ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeRTF`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:21:30
   |
21 |         NSPasteboardTypePNG, NSPasteboardTypeRTF, NSPasteboardTypeRTFD, NSPasteboardTypeString,
   |                              ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeRTFD`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:21:51
   |
21 |         NSPasteboardTypePNG, NSPasteboardTypeRTF, NSPasteboardTypeRTFD, NSPasteboardTypeString,
   |                                                   ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeString`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:21:73
   |
21 |         NSPasteboardTypePNG, NSPasteboardTypeRTF, NSPasteboardTypeRTFD, NSPasteboardTypeString,
   |                                                                         ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeTIFF`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:22:9
   |
22 |         NSPasteboardTypeTIFF, NSSavePanel, NSWindow,
   |         ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSSavePanel`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:22:31
   |
22 |         NSPasteboardTypeTIFF, NSSavePanel, NSWindow,
   |                               ^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSWindow`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/platform.rs:22:44
   |
22 |         NSPasteboardTypeTIFF, NSSavePanel, NSWindow,
   |                                            ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:24:27
   |
24 |     base::{BOOL, NO, YES, id, nil, selector},
   |                           ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:24:31
   |
24 |     base::{BOOL, NO, YES, id, nil, selector},
   |                               ^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:24:36
   |
24 |     base::{BOOL, NO, YES, id, nil, selector},
   |                                    ^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSArray`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:9
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |         ^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSAutoreleasePool`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:18
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                  ^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSBundle`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:37
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                     ^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSData`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:47
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                               ^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:55
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                                       ^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSProcessInfo`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:66
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                                                  ^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:81
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                                                                 ^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:26:90
   |
26 |         NSArray, NSAutoreleasePool, NSBundle, NSData, NSInteger, NSProcessInfo, NSRange, NSString,
   |                                                                                          ^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:27:9
   |
27 |         NSUInteger, NSURL,
   |         ^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSURL`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:27:21
   |
27 |         NSUInteger, NSURL,
   |                     ^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/platform.rs:66:29
   |
66 | const NSUTF8StringEncoding: NSUInteger = 4;
   |                             ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:87:73
   |
87 |                 did_finish_launching as extern "C" fn(&mut Object, Sel, id),
   |                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:91:73
   |
91 |                 should_handle_reopen as extern "C" fn(&mut Object, Sel, id, bool),
   |                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:95:67
   |
95 |                 will_terminate as extern "C" fn(&mut Object, Sel, id),
   |                                                                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/platform.rs:99:69
   |
99 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
   |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:104:69
    |
104 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:108:69
    |
108 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:112:69
    |
112 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:116:69
    |
116 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:120:69
    |
120 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:124:69
    |
124 |                 handle_menu_item as extern "C" fn(&mut Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:128:71
    |
128 |                 validate_menu_item as extern "C" fn(&mut Object, Sel, id) -> bool,
    |                                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:132:67
    |
132 |                 menu_will_open as extern "C" fn(&mut Object, Sel, id),
    |                                                                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:136:69
    |
136 |                 handle_dock_menu as extern "C" fn(&mut Object, Sel, id) -> id,
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:136:76
    |
136 |                 handle_dock_menu as extern "C" fn(&mut Object, Sel, id) -> id,
    |                                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:140:62
    |
140 |                 open_urls as extern "C" fn(&mut Object, Sel, id, id),
    |                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:140:66
    |
140 |                 open_urls as extern "C" fn(&mut Object, Sel, id, id),
    |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:145:78
    |
145 |                 on_keyboard_layout_change as extern "C" fn(&mut Object, Sel, id),
    |                                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:161:17
    |
161 |     pasteboard: id,
    |                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:162:32
    |
162 |     text_hash_pasteboard_type: id,
    |                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:163:31
    |
163 |     metadata_pasteboard_type: id,
    |                               ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:173:23
    |
173 |     dock_menu: Option<id>,
    |                       ^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:515:42
    |
515 |                 let app = NSApplication::sharedApplication(nil);
    |                                          ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:515:60
    |
515 |                 let app = NSApplication::sharedApplication(nil);
    |                                                            ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:516:55
    |
516 |                 let _: () = msg_send![app, terminate: nil];
    |                                                       ^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1008:39
     |
1008 |         const NSScrollerStyleOverlay: NSInteger = 1;
     |                                       ^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1318:36
     |
1318 | fn try_clipboard_image(pasteboard: id, format: ImageFormat) -> Option<ClipboardItem> {
     |                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1322:20
     |
1322 |         let types: id = pasteboard.types();
     |                    ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1325:24
     |
1325 |             if data == nil {
     |                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1344:32
     |
1344 | unsafe fn path_from_objc(path: id) -> PathBuf {
     |                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1359:66
     |
1359 | extern "C" fn did_finish_launching(this: &mut Object, _: Sel, _: id) {
     |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1361:18
     |
1361 |         let app: id = msg_send![APP_CLASS, sharedApplication];
     |                  ^^

warning: use of deprecated unit variant `cocoa::appkit::NSApplicationActivationPolicyRegular`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1362:34
     |
1362 |         app.setActivationPolicy_(NSApplicationActivationPolicyRegular);
     |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1367:73
     |
1367 |         let _: () = msg_send![notification_center, addObserver: this as id
     |                                                                         ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1370:21
     |
1370 |             object: nil
     |                     ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1381:66
     |
1381 | extern "C" fn should_handle_reopen(this: &mut Object, _: Sel, _: id, has_open_windows: bool) {
     |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1393:60
     |
1393 | extern "C" fn will_terminate(this: &mut Object, _: Sel, _: id) {
     |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1403:71
     |
1403 | extern "C" fn on_keyboard_layout_change(this: &mut Object, _: Sel, _: id) {
     |                                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1419:55
     |
1419 | extern "C" fn open_urls(this: &mut Object, _: Sel, _: id, urls: id) {
     |                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1419:65
     |
1419 | extern "C" fn open_urls(this: &mut Object, _: Sel, _: id, urls: id) {
     |                                                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1443:65
     |
1443 | extern "C" fn handle_menu_item(this: &mut Object, _: Sel, item: id) {
     |                                                                 ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1448:22
     |
1448 |             let tag: NSInteger = msg_send![item, tag];
     |                      ^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1460:67
     |
1460 | extern "C" fn validate_menu_item(this: &mut Object, _: Sel, item: id) -> bool {
     |                                                                   ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1466:22
     |
1466 |             let tag: NSInteger = msg_send![item, tag];
     |                      ^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1483:60
     |
1483 | extern "C" fn menu_will_open(this: &mut Object, _: Sel, _: id) {
     |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1495:62
     |
1495 | extern "C" fn handle_dock_menu(this: &mut Object, _: Sel, _: id) -> id {
     |                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1495:69
     |
1495 | extern "C" fn handle_dock_menu(this: &mut Object, _: Sel, _: id) -> id {
     |                                                                     ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1502:13
     |
1502 |             nil
     |             ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1507:38
     |
1507 | unsafe fn ns_string(string: &str) -> id {
     |                                      ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1508:24
     |
1508 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
     |                        ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1508:30
     |
1508 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
     |                              ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1511:31
     |
1511 | unsafe fn ns_url_to_path(url: id) -> Result<PathBuf> {
     |                               ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1587:15
     |
1587 | struct UTType(id);
     |               ^^

warning: use of deprecated associated function `cocoa::appkit::NSPasteboard::generalPasteboard`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:203:48
    |
203 |             pasteboard: unsafe { NSPasteboard::generalPasteboard(nil) },
    |                                                ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:203:66
    |
203 |             pasteboard: unsafe { NSPasteboard::generalPasteboard(nil) },
    |                                                                  ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:221:74
    |
221 |     unsafe fn read_from_pasteboard(&self, pasteboard: *mut Object, kind: id) -> Option<&[u8]> {
    |                                                                          ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:224:24
    |
224 |             if data == nil {
    |                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:238:19
    |
238 |         delegate: id,
    |                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:241:10
    |
241 |     ) -> id {
    |          ^^

warning: use of deprecated associated function `cocoa::appkit::NSMenu::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:243:44
    |
243 |             let application_menu = NSMenu::new(nil).autorelease();
    |                                            ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:243:48
    |
243 |             let application_menu = NSMenu::new(nil).autorelease();
    |                                                ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenu::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:247:36
    |
247 |                 let menu = NSMenu::new(nil).autorelease();
    |                                    ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:247:40
    |
247 |                 let menu = NSMenu::new(nil).autorelease();
    |                                        ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:261:45
    |
261 |                 let menu_item = NSMenuItem::new(nil).autorelease();
    |                                             ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:261:49
    |
261 |                 let menu_item = NSMenuItem::new(nil).autorelease();
    |                                                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:267:30
    |
267 |                     let app: id = msg_send![APP_CLASS, sharedApplication];
    |                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:279:19
    |
279 |         delegate: id,
    |                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:282:10
    |
282 |     ) -> id {
    |          ^^

warning: use of deprecated associated function `cocoa::appkit::NSMenu::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:284:37
    |
284 |             let dock_menu = NSMenu::new(nil);
    |                                     ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:284:41
    |
284 |             let dock_menu = NSMenu::new(nil);
    |                                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:301:19
    |
301 |         delegate: id,
    |                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:304:10
    |
304 |     ) -> id {
    |          ^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::separatorItem`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:309:52
    |
309 |                 MenuItem::Separator => NSMenuItem::separatorItem(nil),
    |                                                    ^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:309:66
    |
309 |                 MenuItem::Separator => NSMenuItem::separatorItem(nil),
    |                                                                  ^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:339:55
    |
339 |                         Some(crate::OsAction::Cut) => selector("cut:"),
    |                                                       ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:340:56
    |
340 |                         Some(crate::OsAction::Copy) => selector("copy:"),
    |                                                        ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:341:57
    |
341 |                         Some(crate::OsAction::Paste) => selector("paste:"),
    |                                                         ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:342:61
    |
342 |                         Some(crate::OsAction::SelectAll) => selector("selectAll:"),
    |                                                             ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:345:56
    |
345 |                         Some(crate::OsAction::Undo) => selector("handleGPUIMenuItem:"),
    |                                                        ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:346:56
    |
346 |                         Some(crate::OsAction::Redo) => selector("handleGPUIMenuItem:"),
    |                                                        ^^^^^^^^

warning: use of deprecated function `cocoa::base::selector`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:347:33
    |
347 |                         None => selector("handleGPUIMenuItem:"),
    |                                 ^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:354:44
    |
354 | ...                   let mut mask = NSEventModifierFlags::empty();
    |                                      ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:358:37
    |
358 | ...                   NSEventModifierFlags::NSCommandKeyMask,
    |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:362:37
    |
362 | ...                   NSEventModifierFlags::NSControlKeyMask,
    |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:366:37
    |
366 | ...                   NSEventModifierFlags::NSAlternateKeyMask,
    |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:370:37
    |
370 | ...                   NSEventModifierFlags::NSShiftKeyMask,
    |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::alloc`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:378:48
    |
378 | ...                   item = NSMenuItem::alloc(nil)
    |                                          ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:378:54
    |
378 | ...                   item = NSMenuItem::alloc(nil)
    |                                                ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::alloc`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:390:48
    |
390 | ...                   item = NSMenuItem::alloc(nil)
    |                                          ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:390:54
    |
390 | ...                   item = NSMenuItem::alloc(nil)
    |                                                ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::alloc`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:399:44
    |
399 |                         item = NSMenuItem::alloc(nil)
    |                                            ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:399:50
    |
399 |                         item = NSMenuItem::alloc(nil)
    |                                                  ^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:408:48
    |
408 |                     let tag = actions.len() as NSInteger;
    |                                                ^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:414:44
    |
414 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                            ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:414:48
    |
414 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                                ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenu::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:415:43
    |
415 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                           ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:415:47
    |
415 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                               ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenuItem::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:425:44
    |
425 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                            ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:425:48
    |
425 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                                ^^^

warning: use of deprecated associated function `cocoa::appkit::NSMenu::new`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:426:43
    |
426 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                           ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:426:47
    |
426 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                               ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:433:38
    |
433 | ...                   let app: id = msg_send![APP_CLASS, sharedApplication];
    |                                ^^

warning: use of deprecated associated function `cocoa::foundation::NSProcessInfo::processInfo`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:446:47
    |
446 |             let process_info = NSProcessInfo::processInfo(nil);
    |                                               ^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:446:59
    |
446 |             let process_info = NSProcessInfo::processInfo(nil);
    |                                                           ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:482:22
    |
482 |             let app: id = msg_send![APP_CLASS, sharedApplication];
    |                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:483:31
    |
483 |             let app_delegate: id = msg_send![APP_DELEGATE_CLASS, new];
    |                               ^^

warning: use of deprecated associated function `cocoa::foundation::NSAutoreleasePool::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:490:43
    |
490 |             let pool = NSAutoreleasePool::new(nil);
    |                                           ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:490:47
    |
490 |             let pool = NSAutoreleasePool::new(nil);
    |                                               ^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::delegate`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:495:25
    |
495 |             (*NSWindow::delegate(app)).set_ivar(MAC_PLATFORM_IVAR, null_mut::<c_void>());
    |                         ^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:558:38
    |
558 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:558:56
    |
558 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:565:38
    |
565 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:565:56
    |
565 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:566:46
    |
566 |             let _: () = msg_send![app, hide: nil];
    |                                              ^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:572:38
    |
572 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:572:56
    |
572 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:573:63
    |
573 |             let _: () = msg_send![app, hideOtherApplications: nil];
    |                                                               ^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:579:38
    |
579 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:579:56
    |
579 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:580:63
    |
580 |             let _: () = msg_send![app, unhideAllApplications: nil];
    |                                                               ^^^

warning: use of deprecated struct `cocoa::foundation::NSOperatingSystemVersion`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:596:46
    |
596 |         let min_version = cocoa::foundation::NSOperatingSystemVersion::new(12, 3, 0);
    |                                              ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:633:38
    |
633 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:633:56
    |
633 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:634:29
    |
634 |             let appearance: id = msg_send![app, effectiveAppearance];
    |                             ^^

warning: use of deprecated associated function `cocoa::foundation::NSURL::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:641:30
    |
641 |             let url = NSURL::alloc(nil)
    |                              ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:641:36
    |
641 |             let url = NSURL::alloc(nil)
    |                                    ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:644:28
    |
644 |             let workspace: id = msg_send![class!(NSWorkspace), sharedWorkspace];
    |                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:660:25
    |
660 |             let bundle: id = msg_send![class!(NSBundle), mainBundle];
    |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:661:28
    |
661 |             let bundle_id: id = msg_send![bundle, bundleIdentifier];
    |                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:662:29
    |
662 |             if bundle_id == nil {
    |                             ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:669:28
    |
669 |             let workspace: id = msg_send![class!(NSWorkspace), sharedWorkspace];
    |                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:670:25
    |
670 |             let scheme: id = ns_string(scheme);
    |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:671:22
    |
671 |             let app: id = msg_send![workspace, URLForApplicationWithBundleIdentifier: bundle_id];
    |                      ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:672:23
    |
672 |             if app == nil {
    |                       ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:678:57
    |
678 |             let block = ConcreteBlock::new(move |error: id| {
    |                                                         ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:679:42
    |
679 |                 let result = if error == nil {
    |                                          ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:682:30
    |
682 |                     let msg: id = msg_send![error, localizedDescription];
    |                              ^^

warning: use of deprecated associated function `cocoa::appkit::NSOpenPanel::openPanel`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:710:46
    |
710 |                     let panel = NSOpenPanel::openPanel(nil);
    |                                              ^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:710:56
    |
710 |                     let panel = NSOpenPanel::openPanel(nil);
    |                                                        ^^^

warning: use of deprecated enum `cocoa::appkit::NSModalResponse`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:718:68
    |
718 |                     let block = ConcreteBlock::new(move |response: NSModalResponse| {
    |                                                                    ^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSModalResponse::NSModalResponseOk`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:719:70
    |
719 |                         let result = if response == NSModalResponse::NSModalResponseOk {
    |                                                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSSavePanel::savePanel`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:763:46
    |
763 |                     let panel = NSSavePanel::savePanel(nil);
    |                                              ^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:763:56
    |
763 |                     let panel = NSSavePanel::savePanel(nil);
    |                                                        ^^^

warning: use of deprecated associated function `cocoa::foundation::NSURL::fileURLWithPath_isDirectory_`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:765:38
    |
765 |                     let url = NSURL::fileURLWithPath_isDirectory_(nil, path, true.to_objc());
    |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:765:67
    |
765 |                     let url = NSURL::fileURLWithPath_isDirectory_(nil, path, true.to_objc());
    |                                                                   ^^^

warning: use of deprecated enum `cocoa::appkit::NSModalResponse`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:774:68
    |
774 |                     let block = ConcreteBlock::new(move |response: NSModalResponse| {
    |                                                                    ^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSModalResponse::NSModalResponseOk`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:776:57
    |
776 |                         if response == NSModalResponse::NSModalResponseOk {
    |                                                         ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:837:36
    |
837 |                     let workspace: id = msg_send![class!(NSWorkspace), sharedWorkspace];
    |                                    ^^

warning: use of deprecated associated function `cocoa::foundation::NSBundle::mainBundle`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:897:40
    |
897 |             let bundle: id = NSBundle::mainBundle();
    |                                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:897:25
    |
897 |             let bundle: id = NSBundle::mainBundle();
    |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:905:22
    |
905 |             let app: id = msg_send![APP_CLASS, sharedApplication];
    |                      ^^

warning: use of deprecated method `cocoa::appkit::NSWindow::delegate`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:908:63
    |
908 |             let menu = self.create_menu_bar(&menus, NSWindow::delegate(app), actions, keymap);
    |                                                               ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:921:22
    |
921 |             let app: id = msg_send![APP_CLASS, sharedApplication];
    |                      ^^

warning: use of deprecated method `cocoa::appkit::NSWindow::delegate`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:924:61
    |
924 |             let new = self.create_dock_menu(menu, NSWindow::delegate(app), actions, keymap);
    |                                                             ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:934:42
    |
934 |                 let document_controller: id =
    |                                          ^^

warning: use of deprecated associated function `cocoa::foundation::NSURL::fileURLWithPath_`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:936:38
    |
936 |                 let url: id = NSURL::fileURLWithPath_(nil, ns_string(path_str));
    |                                      ^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:936:55
    |
936 |                 let url: id = NSURL::fileURLWithPath_(nil, ns_string(path_str));
    |                                                       ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:936:26
    |
936 |                 let url: id = NSURL::fileURLWithPath_(nil, ns_string(path_str));
    |                          ^^

warning: use of deprecated associated function `cocoa::foundation::NSBundle::mainBundle`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:944:40
    |
944 |             let bundle: id = NSBundle::mainBundle();
    |                                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:944:25
    |
944 |             let bundle: id = NSBundle::mainBundle();
    |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:947:22
    |
947 |             let url: id = msg_send![bundle, URLForAuxiliaryExecutable: name];
    |                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:962:29
    |
962 |             let new_cursor: id = match style {
    |                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/platform.rs:999:29
    |
999 |             let old_cursor: id = msg_send![class!(NSCursor), currentCursor];
    |                             ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1011:24
     |
1011 |             let style: NSInteger = msg_send![class!(NSScroller), preferredScrollerStyle];
     |                        ^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1040:68
     |
1040 |                     let mut buf = NSMutableAttributedString::alloc(nil)
     |                                                                    ^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1042:59
     |
1042 |                         .init_attributed_string(NSString::alloc(nil).init_str(""));
     |                                                           ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1042:65
     |
1042 |                         .init_attributed_string(NSString::alloc(nil).init_str(""));
     |                                                                 ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1047:71
     |
1047 | ...                   let to_append = NSAttributedString::alloc(nil)
     |                                                                 ^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1048:67
     |
1048 | ...                   .init_attributed_string(NSString::alloc(nil).init_str(&text));
     |                                                         ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1048:73
     |
1048 | ...                   .init_attributed_string(NSString::alloc(nil).init_str(&text));
     |                                                               ^^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1063:25
     |
1063 |                         NSRange::new(0, msg_send![attributed_string, length]),
     |                         ^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1064:25
     |
1064 |                         nil,
     |                         ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1066:37
     |
1066 |                     if rtfd_data != nil {
     |                                     ^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeRTFD`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1069:57
     |
1069 | ...                   .setData_forType(rtfd_data, NSPasteboardTypeRTFD);
     |                                                   ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRange`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1073:25
     |
1073 |                         NSRange::new(0, attributed_string.length()),
     |                         ^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1074:25
     |
1074 |                         nil,
     |                         ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1076:36
     |
1076 |                     if rtf_data != nil {
     |                                    ^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeRTF`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1079:56
     |
1079 | ...                   .setData_forType(rtf_data, NSPasteboardTypeRTF);
     |                                                  ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeString`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1086:52
     |
1086 |                     .setString_forType(plain_text, NSPasteboardTypeString);
     |                                                    ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1097:24
     |
1097 |             let types: id = pasteboard.types();
     |                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1098:30
     |
1098 |             let string_type: id = ns_string("public.utf8-plain-text");
     |                              ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1102:28
     |
1102 |                 if data == nil {
     |                            ^^^

warning: use of deprecated associated function `cocoa::foundation::NSData::dataWithBytes_length_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1268:38
     |
1268 |             let text_bytes = NSData::dataWithBytes_length_(
     |                                      ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1269:17
     |
1269 |                 nil,
     |                 ^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeString`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1275:46
     |
1275 |                 .setData_forType(text_bytes, NSPasteboardTypeString);
     |                                              ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSData::dataWithBytes_length_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1279:42
     |
1279 |                 let hash_bytes = NSData::dataWithBytes_length_(
     |                                          ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1280:21
     |
1280 |                     nil,
     |                     ^^^

warning: use of deprecated associated function `cocoa::foundation::NSData::dataWithBytes_length_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1288:46
     |
1288 |                 let metadata_bytes = NSData::dataWithBytes_length_(
     |                                              ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1289:21
     |
1289 |                     nil,
     |                     ^^^

warning: use of deprecated associated function `cocoa::foundation::NSData::dataWithBytes_length_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1305:33
     |
1305 |             let bytes = NSData::dataWithBytes_length_(
     |                                 ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1306:17
     |
1306 |                 nil,
     |                 ^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypePNG`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1592:23
     |
1592 |         Self(unsafe { NSPasteboardTypePNG }) // This is a rare case where there's a built-in NSPasteboardType
     |                       ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSPasteboardTypeTIFF`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1622:23
     |
1622 |         Self(unsafe { NSPasteboardTypeTIFF }) // This is a rare case where there's a built-in NSPasteboardType
     |                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSAppKitVersionNumber`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:15:9
   |
15 |         NSAppKitVersionNumber, NSAppKitVersionNumber12_0, NSApplication, NSBackingStoreBuffered,
   |         ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSAppKitVersionNumber12_0`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:15:32
   |
15 |         NSAppKitVersionNumber, NSAppKitVersionNumber12_0, NSApplication, NSBackingStoreBuffered,
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSApplication`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:15:59
   |
15 |         NSAppKitVersionNumber, NSAppKitVersionNumber12_0, NSApplication, NSBackingStoreBuffered,
   |                                                           ^^^^^^^^^^^^^

warning: use of deprecated variant `cocoa::appkit::NSBackingStoreBuffered`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:15:74
   |
15 |         NSAppKitVersionNumber, NSAppKitVersionNumber12_0, NSApplication, NSBackingStoreBuffered,
   |                                                                          ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSBackingStoreBuffered`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:15:74
   |
15 |         NSAppKitVersionNumber, NSAppKitVersionNumber12_0, NSApplication, NSBackingStoreBuffered,
   |                                                                          ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSColor`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:9
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |         ^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSEvent`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:18
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |                  ^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:27
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |                           ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSFilenamesPboardType`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:49
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |                                                 ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSPasteboard`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:72
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |                                                                        ^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSScreen`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:16:86
   |
16 |         NSColor, NSEvent, NSEventModifierFlags, NSFilenamesPboardType, NSPasteboard, NSScreen,
   |                                                                                      ^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSView`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:17:9
   |
17 |         NSView, NSViewHeightSizable, NSViewWidthSizable, NSVisualEffectMaterial,
   |         ^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewHeightSizable`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:17:17
   |
17 |         NSView, NSViewHeightSizable, NSViewWidthSizable, NSVisualEffectMaterial,
   |                 ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewWidthSizable`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:17:38
   |
17 |         NSView, NSViewHeightSizable, NSViewWidthSizable, NSVisualEffectMaterial,
   |                                      ^^^^^^^^^^^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSVisualEffectMaterial`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:17:58
   |
17 |         NSView, NSViewHeightSizable, NSViewWidthSizable, NSVisualEffectMaterial,
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSVisualEffectState`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:18:9
   |
18 |         NSVisualEffectState, NSVisualEffectView, NSWindow, NSWindowButton,
   |         ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSVisualEffectView`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:18:30
   |
18 |         NSVisualEffectState, NSVisualEffectView, NSWindow, NSWindowButton,
   |                              ^^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::appkit::NSWindow`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:18:50
   |
18 |         NSVisualEffectState, NSVisualEffectView, NSWindow, NSWindowButton,
   |                                                  ^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSWindowButton`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:18:60
   |
18 |         NSVisualEffectState, NSVisualEffectView, NSWindow, NSWindowButton,
   |                                                            ^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowCollectionBehavior`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:19:9
   |
19 |         NSWindowCollectionBehavior, NSWindowOcclusionState, NSWindowOrderingMode,
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOcclusionState`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:19:37
   |
19 |         NSWindowCollectionBehavior, NSWindowOcclusionState, NSWindowOrderingMode,
   |                                     ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOrderingMode`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:19:61
   |
19 |         NSWindowCollectionBehavior, NSWindowOcclusionState, NSWindowOrderingMode,
   |                                                             ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:20:9
   |
20 |         NSWindowStyleMask, NSWindowTitleVisibility,
   |         ^^^^^^^^^^^^^^^^^

warning: use of deprecated enum `cocoa::appkit::NSWindowTitleVisibility`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:20:28
   |
20 |         NSWindowStyleMask, NSWindowTitleVisibility,
   |                            ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window.rs:22:12
   |
22 |     base::{id, nil},
   |            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window.rs:22:16
   |
22 |     base::{id, nil},
   |                ^^^

warning: use of deprecated trait `cocoa::foundation::NSArray`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:9
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |         ^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSAutoreleasePool`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:18
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |                  ^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSDictionary`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:37
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |                                     ^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSFastEnumeration`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:51
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |                                                   ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:70
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |                                                                      ^^^^^^^^^

warning: use of deprecated constant `cocoa::foundation::NSNotFound`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:24:81
   |
24 |         NSArray, NSAutoreleasePool, NSDictionary, NSFastEnumeration, NSInteger, NSNotFound,
   |                                                                                 ^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSOperatingSystemVersion`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:9
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |         ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:35
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                   ^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSProcessInfo`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:44
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                            ^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:59
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                                           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:67
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                                                   ^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:75
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                                                           ^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:25:85
   |
25 |         NSOperatingSystemVersion, NSPoint, NSProcessInfo, NSRect, NSSize, NSString, NSUInteger,
   |                                                                                     ^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSUserDefaults`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:26:9
   |
26 |         NSUserDefaults,
   |         ^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:64:44
   |
64 | const NSWindowStyleMaskNonactivatingPanel: NSWindowStyleMask =
   |                                            ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:65:5
   |
65 |     NSWindowStyleMask::from_bits_retain(1 << 7);
   |     ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:67:28
   |
67 | const NSNormalWindowLevel: NSInteger = 0;
   |                            ^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:69:27
   |
69 | const NSPopUpWindowLevel: NSInteger = 101;
   |                           ^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:71:40
   |
71 | const NSTrackingMouseEnteredAndExited: NSUInteger = 0x01;
   |                                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:73:29
   |
73 | const NSTrackingMouseMoved: NSUInteger = 0x02;
   |                             ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:75:31
   |
75 | const NSTrackingActiveAlways: NSUInteger = 0x80;
   |                               ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:77:32
   |
77 | const NSTrackingInVisibleRect: NSUInteger = 0x200;
   |                                ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:79:47
   |
79 | const NSWindowAnimationBehaviorUtilityWindow: NSInteger = 4;
   |                                               ^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:81:50
   |
81 | const NSViewLayerContentsRedrawDuringViewResize: NSInteger = 2;
   |                                                  ^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window.rs:83:24
   |
83 | type NSDragOperation = NSUInteger;
   |                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:119:74
    |
119 |                     handle_key_equivalent as extern "C" fn(&Object, Sel, id) -> BOOL,
    |                                                                          ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:123:68
    |
123 |                     handle_key_down as extern "C" fn(&Object, Sel, id),
    |                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:127:66
    |
127 |                     handle_key_up as extern "C" fn(&Object, Sel, id),
    |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:131:70
    |
131 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:135:70
    |
135 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:139:70
    |
139 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:143:70
    |
143 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:147:70
    |
147 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:151:70
    |
151 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:155:70
    |
155 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:159:70
    |
159 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:163:70
    |
163 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:167:70
    |
167 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:171:70
    |
171 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:175:70
    |
175 |                     handle_view_event as extern "C" fn(&Object, Sel, id),
    |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:180:74
    |
180 |                     make_backing_layer as extern "C" fn(&Object, Sel) -> id,
    |                                                                          ^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:190:67
    |
190 |                     set_frame_size as extern "C" fn(&Object, Sel, NSSize),
    |                                                                   ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:194:66
    |
194 |                     display_layer as extern "C" fn(&Object, Sel, id),
    |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:200:88
    |
200 |                     valid_attributes_for_marked_text as extern "C" fn(&Object, Sel) -> id,
    |                                                                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:217:65
    |
217 |                         as extern "C" fn(&Object, Sel, NSRange, id) -> NSRect,
    |                                                                 ^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:217:72
    |
217 |                         as extern "C" fn(&Object, Sel, NSRange, id) -> NSRect,
    |                                                                        ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:221:64
    |
221 |                     insert_text as extern "C" fn(&Object, Sel, id, NSRange),
    |                                                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:225:68
    |
225 |                     set_marked_text as extern "C" fn(&Object, Sel, id, NSRange, NSRange),
    |                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:231:81
    |
231 |                         as extern "C" fn(&Object, Sel, NSRange, *mut c_void) -> id,
    |                                                                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:246:72
    |
246 |                     accepts_first_mouse as extern "C" fn(&Object, Sel, id) -> BOOL,
    |                                                                        ^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:251:78
    |
251 |                     character_index_for_point as extern "C" fn(&Object, Sel, NSPoint) -> u64,
    |                                                                              ^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:261:81
    |
261 |                     blurred_view_init_with_frame as extern "C" fn(&Object, Sel, NSRect) -> id,
    |                                                                                 ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:261:92
    |
261 |                     blurred_view_init_with_frame as extern "C" fn(&Object, Sel, NSRect) -> id,
    |                                                                                            ^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:273:48
    |
273 | pub(crate) fn convert_mouse_position(position: NSPoint, window_height: Pixels) -> Point<Pixels> {
    |                                                ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:297:62
    |
297 |             window_did_resize as extern "C" fn(&Object, Sel, id),
    |                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:301:78
    |
301 |             window_did_change_occlusion_state as extern "C" fn(&Object, Sel, id),
    |                                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:305:73
    |
305 |             window_will_enter_fullscreen as extern "C" fn(&Object, Sel, id),
    |                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:309:72
    |
309 |             window_will_exit_fullscreen as extern "C" fn(&Object, Sel, id),
    |                                                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:313:60
    |
313 |             window_did_move as extern "C" fn(&Object, Sel, id),
    |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:317:69
    |
317 |             window_did_change_screen as extern "C" fn(&Object, Sel, id),
    |                                                                     ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:321:73
    |
321 |             window_did_change_key_status as extern "C" fn(&Object, Sel, id),
    |                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:325:73
    |
325 |             window_did_change_key_status as extern "C" fn(&Object, Sel, id),
    |                                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:329:64
    |
329 |             window_should_close as extern "C" fn(&Object, Sel, id) -> BOOL,
    |                                                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:336:61
    |
336 |             dragging_entered as extern "C" fn(&Object, Sel, id) -> NSDragOperation,
    |                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:340:61
    |
340 |             dragging_updated as extern "C" fn(&Object, Sel, id) -> NSDragOperation,
    |                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:344:60
    |
344 |             dragging_exited as extern "C" fn(&Object, Sel, id),
    |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:348:67
    |
348 |             perform_drag_operation as extern "C" fn(&Object, Sel, id) -> BOOL,
    |                                                                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:352:68
    |
352 |             conclude_drag_operation as extern "C" fn(&Object, Sel, id),
    |                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:357:83
    |
357 |             add_titlebar_accessory_view_controller as extern "C" fn(&Object, Sel, id),
    |                                                                                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:362:67
    |
362 |             move_tab_to_new_window as extern "C" fn(&Object, Sel, id),
    |                                                                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:367:62
    |
367 |             merge_all_windows as extern "C" fn(&Object, Sel, id),
    |                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:372:60
    |
372 |             select_next_tab as extern "C" fn(&Object, Sel, id),
    |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:377:64
    |
377 |             select_previous_tab as extern "C" fn(&Object, Sel, id),
    |                                                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:382:59
    |
382 |             toggle_tab_bar as extern "C" fn(&Object, Sel, id),
    |                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:392:20
    |
392 |     native_window: id,
    |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:394:26
    |
394 |     blurred_view: Option<id>,
    |                          ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:984:44
    |
984 |             let native_window = context as id;
    |                                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:985:66
    |
985 |             let _: () = msg_send![native_window, mergeAllWindows:nil];
    |                                                                  ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1000:44
     |
1000 |             let native_window = context as id;
     |                                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1001:69
     |
1001 |             let _: () = msg_send![native_window, moveTabToNewWindow:nil];
     |                                                                     ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1002:72
     |
1002 |             let _: () = msg_send![native_window, makeKeyAndOrderFront: nil];
     |                                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1544:36
     |
1544 | fn get_scale_factor(native_window: id) -> f32 {
     |                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1546:21
     |
1546 |         let screen: id = msg_send![native_window, screen];
     |                     ^^

warning: use of deprecated method `cocoa::appkit::NSScreen::backingScaleFactor`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1550:19
     |
1550 |         NSScreen::backingScaleFactor(screen) as f32
     |                   ^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1597:74
     |
1597 | extern "C" fn handle_key_equivalent(this: &Object, _: Sel, native_event: id) -> BOOL {
     |                                                                          ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1601:68
     |
1601 | extern "C" fn handle_key_down(this: &Object, _: Sel, native_event: id) {
     |                                                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1605:66
     |
1605 | extern "C" fn handle_key_up(this: &Object, _: Sel, native_event: id) {
     |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1634:61
     |
1634 | extern "C" fn handle_key_event(this: &Object, native_event: id, key_equivalent: bool) -> BOOL {
     |                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1696:40
     |
1696 |                     let input_context: id = msg_send![this, inputContext];
     |                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1737:36
     |
1737 |                 let input_context: id = msg_send![this, inputContext];
     |                                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1751:70
     |
1751 | extern "C" fn handle_view_event(this: &Object, _: Sel, native_event: id) {
     |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1821:40
     |
1821 |                     let input_context: id = msg_send![this, inputContext];
     |                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1881:75
     |
1881 | extern "C" fn window_did_change_occlusion_state(this: &Object, _: Sel, _: id) {
     |                                                                           ^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOcclusionState`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1888:23
     |
1888 |             .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
     |                       ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1898:59
     |
1898 | extern "C" fn window_did_resize(this: &Object, _: Sel, _: id) {
     |                                                           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1903:70
     |
1903 | extern "C" fn window_will_enter_fullscreen(this: &Object, _: Sel, _: id) {
     |                                                                      ^^

warning: use of deprecated struct `cocoa::foundation::NSOperatingSystemVersion`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1908:23
     |
1908 |     let min_version = NSOperatingSystemVersion::new(15, 3, 0);
     |                       ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1917:69
     |
1917 | extern "C" fn window_will_exit_fullscreen(this: &Object, _: Sel, _: id) {
     |                                                                     ^^

warning: use of deprecated struct `cocoa::foundation::NSOperatingSystemVersion`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1921:23
     |
1921 |     let min_version = NSOperatingSystemVersion::new(15, 3, 0);
     |                       ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSOperatingSystemVersion`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1930:50
     |
1930 | pub(crate) fn is_macos_version_at_least(version: NSOperatingSystemVersion) -> bool {
     |                                                  ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSProcessInfo::processInfo`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1931:29
     |
1931 |     unsafe { NSProcessInfo::processInfo(nil).isOperatingSystemAtLeastVersion(version) }
     |                             ^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1931:41
     |
1931 |     unsafe { NSProcessInfo::processInfo(nil).isOperatingSystemAtLeastVersion(version) }
     |                                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1934:57
     |
1934 | extern "C" fn window_did_move(this: &Object, _: Sel, _: id) {
     |                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1944:66
     |
1944 | extern "C" fn window_did_change_screen(this: &Object, _: Sel, _: id) {
     |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1950:77
     |
1950 | extern "C" fn window_did_change_key_status(this: &Object, selector: Sel, _: id) {
     |                                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2010:61
     |
2010 | extern "C" fn window_should_close(this: &Object, _: Sel, _: id) -> BOOL {
     |                                                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2039:60
     |
2039 | extern "C" fn make_backing_layer(this: &Object, _: Sel) -> id {
     |                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2042:42
     |
2042 |     window_state.renderer.layer_ptr() as id
     |                                          ^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2070:59
     |
2070 | extern "C" fn set_frame_size(this: &Object, _: Sel, size: NSSize) {
     |                                                           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2076:24
     |
2076 |         let old_frame: NSRect = msg_send![this, frame];
     |                        ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2101:55
     |
2101 | extern "C" fn display_layer(this: &Object, _: Sel, _: id) {
     |                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2120:24
     |
2120 |     let view = view as id;
     |                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2131:71
     |
2131 | extern "C" fn valid_attributes_for_marked_text(_: &Object, _: Sel) -> id {
     |                                                                       ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2162:8
     |
2162 |     _: id,
     |        ^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2163:6
     |
2163 | ) -> NSRect {
     |      ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:9
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |         ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:21
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |                     ^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:43
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |                                           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2172:13
     |
2172 |             NSRect::new(
     |             ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2173:17
     |
2173 |                 NSPoint::new(
     |                 ^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2179:17
     |
2179 |                 NSSize::new(bounds.size.width.0 as f64, bounds.size.height.0 as f64),
     |                 ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2185:32
     |
2185 | fn get_frame(this: &Object) -> NSRect {
     |                                ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::frame`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2189:35
     |
2189 |         let mut frame = NSWindow::frame(lock.native_window);
     |                                   ^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2191:25
     |
2191 |         let style_mask: NSWindowStyleMask = msg_send![lock.native_window, styleMask];
     |                         ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2192:33
     |
2192 |         if !style_mask.contains(NSWindowStyleMask::NSFullSizeContentViewWindowMask) {
     |                                 ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2199:56
     |
2199 | extern "C" fn insert_text(this: &Object, _: Sel, text: id, replacement_range: NSRange) {
     |                                                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2203:19
     |
2203 |         let text: id = if is_attributed_string == YES {
     |                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2220:11
     |
2220 |     text: id,
     |           ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2227:19
     |
2227 |         let text: id = if is_attributed_string == YES {
     |                   ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2249:6
     |
2249 | ) -> id {
     |      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2264:25
     |
2264 |             let string: id = msg_send![class!(NSAttributedString), alloc];
     |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2265:25
     |
2265 |             let string: id = msg_send![string, initWithString: ns_string(&selected_text)];
     |                         ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2270:16
     |
2270 |     .unwrap_or(nil)
     |                ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2305:61
     |
2305 | extern "C" fn accepts_first_mouse(this: &Object, _: Sel, _: id) -> BOOL {
     |                                                             ^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2312:74
     |
2312 | extern "C" fn character_index_for_point(this: &Object, _: Sel, position: NSPoint) -> u64 {
     |                                                                          ^^^^^^^

warning: use of deprecated constant `cocoa::foundation::NSNotFound`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2319:16
     |
2319 |     .unwrap_or(NSNotFound as u64)
     |                ^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2322:56
     |
2322 | fn screen_point_to_gpui_point(this: &Object, position: NSPoint) -> Point<Pixels> {
     |                                                        ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2330:70
     |
2330 | extern "C" fn dragging_entered(this: &Object, _: Sel, dragging_info: id) -> NSDragOperation {
     |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2344:70
     |
2344 | extern "C" fn dragging_updated(this: &Object, _: Sel, dragging_info: id) -> NSDragOperation {
     |                                                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2357:57
     |
2357 | extern "C" fn dragging_exited(this: &Object, _: Sel, _: id) {
     |                                                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2366:76
     |
2366 | extern "C" fn perform_drag_operation(this: &Object, _: Sel, dragging_info: id) -> BOOL {
     |                                                                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2378:21
     |
2378 |     let pasteboard: id = unsafe { msg_send![dragging_info, draggingPasteboard] };
     |                     ^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::propertyListForType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2379:44
     |
2379 |     let filenames = unsafe { NSPasteboard::propertyListForType(pasteboard, NSFilenamesPboardType) };
     |                                            ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSFilenamesPboardType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2379:76
     |
2379 |     let filenames = unsafe { NSPasteboard::propertyListForType(pasteboard, NSFilenamesPboardType) };
     |                                                                            ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2380:21
     |
2380 |     if filenames == nil {
     |                     ^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2385:31
     |
2385 |             let f = NSString::UTF8String(file);
     |                               ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2393:65
     |
2393 | extern "C" fn conclude_drag_operation(this: &Object, _: Sel, _: id) {
     |                                                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2434:77
     |
2434 | fn drag_event_position(window_state: &Mutex<MacWindowState>, dragging_info: id) -> Point<Pixels> {
     |                                                                             ^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2435:24
     |
2435 |     let drag_location: NSPoint = unsafe { msg_send![dragging_info, draggingLocation] };
     |                        ^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2455:41
     |
2455 | unsafe fn display_id_for_screen(screen: id) -> CGDirectDisplayID {
     |                                         ^^

warning: use of deprecated method `cocoa::appkit::NSScreen::deviceDescription`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2457:44
     |
2457 |         let device_description = NSScreen::deviceDescription(screen);
     |                                            ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2458:47
     |
2458 |         let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
     |                                               ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2458:53
     |
2458 |         let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
     |                                                     ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2458:32
     |
2458 |         let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
     |                                ^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2460:28
     |
2460 |         let screen_number: NSUInteger = msg_send![screen_number, unsignedIntegerValue];
     |                            ^^^^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2465:74
     |
2465 | extern "C" fn blurred_view_init_with_frame(this: &Object, _: Sel, frame: NSRect) -> id {
     |                                                                          ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2465:85
     |
2465 | extern "C" fn blurred_view_init_with_frame(this: &Object, _: Sel, frame: NSRect) -> id {
     |                                                                                     ^^

warning: use of deprecated method `cocoa::appkit::NSVisualEffectView::setMaterial_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2470:29
     |
2470 |         NSVisualEffectView::setMaterial_(view, NSVisualEffectMaterial::Selection);
     |                             ^^^^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSVisualEffectMaterial::Selection`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2470:72
     |
2470 |         NSVisualEffectView::setMaterial_(view, NSVisualEffectMaterial::Selection);
     |                                                                        ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSVisualEffectView::setState_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2471:29
     |
2471 |         NSVisualEffectView::setState_(view, NSVisualEffectState::Active);
     |                             ^^^^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSVisualEffectState::Active`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2471:66
     |
2471 |         NSVisualEffectView::setState_(view, NSVisualEffectState::Active);
     |                                                                  ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2479:20
     |
2479 |         let layer: id = msg_send![this, layer];
     |                    ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2486:42
     |
2486 | unsafe fn remove_layer_background(layer: id) {
     |                                          ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2488:57
     |
2488 |         let _: () = msg_send![layer, setBackgroundColor:nil];
     |                                                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2490:25
     |
2490 |         let class_name: id = msg_send![layer, className];
     |                         ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2497:22
     |
2497 |         let filters: id = msg_send![layer, filters];
     |                      ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2504:45
     |
2504 |             let test_string: id = NSString::alloc(nil).init_str("Saturat").autorelease();
     |                                             ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2504:51
     |
2504 |             let test_string: id = NSString::alloc(nil).init_str("Saturat").autorelease();
     |                                                   ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2504:30
     |
2504 |             let test_string: id = NSString::alloc(nil).init_str("Saturat").autorelease();
     |                              ^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2505:34
     |
2505 |             let count = NSArray::count(filters);
     |                                  ^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2507:34
     |
2507 |                 let description: id = msg_send![filters.objectAtIndex(i), description];
     |                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2517:30
     |
2517 |                 let indices: id = msg_send![class!(NSMutableIndexSet), indexSet];
     |                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2520:31
     |
2520 |                 let filtered: id = msg_send![filters, objectsAtIndexes: indices];
     |                               ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2526:24
     |
2526 |         let sublayers: id = msg_send![layer, sublayers];
     |                        ^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2528:34
     |
2528 |             let count = NSArray::count(sublayers);
     |                                  ^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2537:94
     |
2537 | extern "C" fn add_titlebar_accessory_view_controller(this: &Object, _: Sel, view_controller: id) {
     |                                                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2542:29
     |
2542 |         let accessory_view: id = msg_send![view_controller, view];
     |                             ^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2544:24
     |
2544 |         let mut frame: NSRect = msg_send![accessory_view, frame];
     |                        ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2550:64
     |
2550 | extern "C" fn move_tab_to_new_window(this: &Object, _: Sel, _: id) {
     |                                                                ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2552:81
     |
2552 |         let _: () = msg_send![super(this, class!(NSWindow)), moveTabToNewWindow:nil];
     |                                                                                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2564:59
     |
2564 | extern "C" fn merge_all_windows(this: &Object, _: Sel, _: id) {
     |                                                           ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2566:78
     |
2566 |         let _: () = msg_send![super(this, class!(NSWindow)), mergeAllWindows:nil];
     |                                                                              ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2578:62
     |
2578 | extern "C" fn select_next_tab(this: &Object, _sel: Sel, _id: id) {
     |                                                              ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2588:66
     |
2588 | extern "C" fn select_previous_tab(this: &Object, _sel: Sel, _id: id) {
     |                                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2598:61
     |
2598 | extern "C" fn toggle_tab_bar(this: &Object, _sel: Sel, _id: id) {
     |                                                             ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:2600:75
     |
2600 |         let _: () = msg_send![super(this, class!(NSWindow)), toggleTabBar:nil];
     |                                                                           ^^^

warning: use of deprecated unit variant `cocoa::appkit::NSWindowButton::NSWindowCloseButton`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:438:59
    |
438 |                     standardWindowButton: NSWindowButton::NSWindowCloseButton
    |                                                           ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:436:35
    |
436 |                 let close_button: id = msg_send![
    |                                   ^^

warning: use of deprecated unit variant `cocoa::appkit::NSWindowButton::NSWindowMiniaturizeButton`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:442:59
    |
442 |                     standardWindowButton: NSWindowButton::NSWindowMiniaturizeButton
    |                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:440:33
    |
440 |                 let min_button: id = msg_send![
    |                                 ^^

warning: use of deprecated unit variant `cocoa::appkit::NSWindowButton::NSWindowZoomButton`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:446:59
    |
446 |                     standardWindowButton: NSWindowButton::NSWindowZoomButton
    |                                                           ^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:444:34
    |
444 |                 let zoom_button: id = msg_send![
    |                                  ^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOcclusionState`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:482:27
    |
482 |                 .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
    |                           ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:511:33
    |
511 |             style_mask.contains(NSWindowStyleMask::NSFullScreenWindowMask)
    |                                 ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:516:51
    |
516 |         let mut window_frame = unsafe { NSWindow::frame(self.native_window) };
    |                                                   ^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::screen`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:518:36
    |
518 |             let screen = NSWindow::screen(self.native_window);
    |                                    ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSScreen::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:519:23
    |
519 |             NSScreen::frame(screen)
    |                       ^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:540:30
    |
540 |             unsafe { NSView::frame(self.native_window.contentView()) }.size;
    |                              ^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:539:13
    |
539 |         let NSSize { width, height, .. } =
    |             ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:550:35
    |
550 |             let frame = NSWindow::frame(self.native_window);
    |                                   ^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSAutoreleasePool::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:589:43
    |
589 |             let pool = NSAutoreleasePool::new(nil);
    |                                           ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:589:47
    |
589 |             let pool = NSAutoreleasePool::new(nil);
    |                                               ^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:601:21
    |
601 |                     NSWindowStyleMask::NSClosableWindowMask | NSWindowStyleMask::NSTitledWindowMask;
    |                     ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:601:63
    |
601 |                     NSWindowStyleMask::NSClosableWindowMask | NSWindowStyleMask::NSTitledWindowMask;
    |                                                               ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:604:35
    |
604 |                     style_mask |= NSWindowStyleMask::NSResizableWindowMask;
    |                                   ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:608:35
    |
608 |                     style_mask |= NSWindowStyleMask::NSMiniaturizableWindowMask;
    |                                   ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:612:35
    |
612 |                     style_mask |= NSWindowStyleMask::NSFullSizeContentViewWindowMask;
    |                                   ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:615:30
    |
615 |                 style_mask = NSWindowStyleMask::NSTitledWindowMask
    |                              ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:616:23
    |
616 |                     | NSWindowStyleMask::NSFullSizeContentViewWindowMask;
    |                       ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:619:32
    |
619 |             let native_window: id = match kind {
    |                                ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:631:37
    |
631 |             let mut target_screen = nil;
    |                                     ^^^

warning: use of deprecated associated function `cocoa::appkit::NSScreen::screens`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:634:37
    |
634 |             let screens = NSScreen::screens(nil);
    |                                     ^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:634:45
    |
634 |             let screens = NSScreen::screens(nil);
    |                                             ^^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:635:58
    |
635 |             let count: u64 = cocoa::foundation::NSArray::count(screens);
    |                                                          ^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:637:58
    |
637 |                 let screen = cocoa::foundation::NSArray::objectAtIndex(screens, i);
    |                                                          ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSScreen::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:638:39
    |
638 |                 let frame = NSScreen::frame(screen);
    |                                       ^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSScreen::mainScreen`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:647:40
    |
647 |                 let screen = NSScreen::mainScreen(nil);
    |                                        ^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:647:51
    |
647 |                 let screen = NSScreen::mainScreen(nil);
    |                                                   ^^^

warning: use of deprecated method `cocoa::appkit::NSScreen::frame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:649:27
    |
649 |                 NSScreen::frame(screen)
    |                           ^^^^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:652:31
    |
652 |             let window_rect = NSRect::new(
    |                               ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:653:17
    |
653 |                 NSPoint::new(
    |                 ^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:658:17
    |
658 |                 NSSize::new(bounds.size.width.0 as f64, bounds.size.height.0 as f64),
    |                 ^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSBackingStoreBuffered`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:664:17
    |
664 |                 NSBackingStoreBuffered,
    |                 ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSArray::arrayWithObject`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:672:30
    |
672 |                     NSArray::arrayWithObject(nil, NSFilenamesPboardType)
    |                              ^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:672:46
    |
672 |                     NSArray::arrayWithObject(nil, NSFilenamesPboardType)
    |                                              ^^^

warning: use of deprecated static `cocoa::appkit::NSFilenamesPboardType`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:672:51
    |
672 |                     NSArray::arrayWithObject(nil, NSFilenamesPboardType)
    |                                                   ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:680:30
    |
680 |             let native_view: id = msg_send![VIEW_CLASS, alloc];
    |                              ^^

warning: use of deprecated method `cocoa::appkit::NSView::initWithFrame_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:681:39
    |
681 |             let native_view = NSView::initWithFrame_(native_view, NSView::bounds(content_view));
    |                                       ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::bounds`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:681:75
    |
681 |             let native_view = NSView::initWithFrame_(native_view, NSView::bounds(content_view));
    |                                                                           ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:748:50
    |
748 |                 native_window.setContentMinSize_(NSSize {
    |                                                  ^^^^^^

warning: use of deprecated unit variant `cocoa::appkit::NSWindowTitleVisibility::NSWindowTitleHidden`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:756:76
    |
756 |                 native_window.setTitleVisibility_(NSWindowTitleVisibility::NSWindowTitleHidden);
    |                                                                            ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewWidthSizable`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:759:46
    |
759 |             native_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
    |                                              ^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewHeightSizable`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:759:67
    |
759 |             native_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
    |                                                                   ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:782:52
    |
782 |                         let tabbing_id = NSString::alloc(nil).init_str(tabbing_identifier.as_str());
    |                                                    ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:782:58
    |
782 |                         let tabbing_id = NSString::alloc(nil).init_str(tabbing_identifier.as_str());
    |                                                          ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:790:40
    |
790 |                     let tracking_area: id = msg_send![class!(NSTrackingArea), alloc];
    |                                        ^^

warning: use of deprecated struct `cocoa::foundation::NSRect`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:39
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                       ^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSPoint`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:51
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                                   ^^^^^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:73
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                                                         ^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:796:35
    |
796 |                         userInfo: nil
    |                                   ^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowCollectionBehavior`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:807:25
    |
807 |                         NSWindowCollectionBehavior::NSWindowCollectionBehaviorCanJoinAllSpaces |
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowCollectionBehavior`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:808:25
    |
808 |                         NSWindowCollectionBehavior::NSWindowCollectionBehaviorFullScreenAuxiliary
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:813:38
    |
813 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:813:56
    |
813 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:814:30
    |
814 |             let main_window: id = msg_send![app, mainWindow];
    |                              ^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:821:31
    |
821 |                     .contains(NSWindowStyleMask::NSFullScreenWindowMask);
    |                               ^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOrderingMode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:834:100
    |
834 | ...   let _: () = msg_send![main_window, addTabbedWindow: native_window ordered: NSWindowOrderingMode::NSWindowAbove];
    |                                                                                  ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:839:78
    |
839 | ...                   let _: () = msg_send![native_window, orderFront: nil];
    |                                                                        ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:846:53
    |
846 |                 native_window.makeKeyAndOrderFront_(nil);
    |                                                     ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:848:43
    |
848 |                 native_window.orderFront_(nil);
    |                                           ^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setFrameTopLeftPoint_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:855:23
    |
855 |             NSWindow::setFrameTopLeftPoint_(native_window, window_rect.origin);
    |                       ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:866:38
    |
866 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:866:56
    |
866 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:867:30
    |
867 |             let main_window: id = msg_send![app, mainWindow];
    |                              ^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:883:38
    |
883 |             let app = NSApplication::sharedApplication(nil);
    |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:883:56
    |
883 |             let app = NSApplication::sharedApplication(nil);
    |                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:884:26
    |
884 |             let windows: id = msg_send![app, orderedWindows];
    |                          ^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:885:24
    |
885 |             let count: NSUInteger = msg_send![windows, count];
    |                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:889:29
    |
889 |                 let window: id = msg_send![windows, objectAtIndex:i];
    |                             ^^

warning: use of deprecated associated function `cocoa::foundation::NSUserDefaults::standardUserDefaults`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:902:48
    |
902 |             let defaults: id = NSUserDefaults::standardUserDefaults();
    |                                                ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:902:27
    |
902 |             let defaults: id = NSUserDefaults::standardUserDefaults();
    |                           ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:903:36
    |
903 |             let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
    |                                    ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:903:42
    |
903 |             let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
    |                                          ^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:904:33
    |
904 |             let key = NSString::alloc(nil).init_str("AppleWindowTabbingMode");
    |                                 ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:904:39
    |
904 |             let key = NSString::alloc(nil).init_str("AppleWindowTabbingMode");
    |                                       ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:906:23
    |
906 |             let dict: id = msg_send![defaults, persistentDomainForName: domain];
    |                       ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:910:17
    |
910 |                 nil
    |                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:907:24
    |
907 |             let value: id = if !dict.is_null() {
    |                        ^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:914:42
    |
914 |                 CStr::from_ptr(NSString::UTF8String(value)).to_string_lossy()
    |                                          ^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:935:45
    |
935 |             this.native_window.setDelegate_(nil);
    |                                             ^^^

warning: use of deprecated struct `cocoa::foundation::NSSize`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:972:44
    |
972 |                     window.setContentSize_(NSSize {
    |                                            ^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1017:68
     |
1017 |             let _: () = msg_send![native_window, toggleTabOverview:nil];
     |                                                                    ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1027:29
     |
1027 |             let appearance: id = msg_send![self.0.lock().native_window, effectiveAppearance];
     |                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1038:37
     |
1038 |             let device_description: id = msg_send![screen, deviceDescription];
     |                                     ^^

warning: use of deprecated method `cocoa::foundation::NSDictionary::valueForKey_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1039:51
     |
1039 |             let screen_number: id = NSDictionary::valueForKey_(
     |                                                   ^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1041:27
     |
1041 |                 NSString::alloc(nil).init_str("NSScreenNumber"),
     |                           ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1041:33
     |
1041 |                 NSString::alloc(nil).init_str("NSScreenNumber"),
     |                                 ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1039:32
     |
1039 |             let screen_number: id = NSDictionary::valueForKey_(
     |                                ^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1062:28
     |
1062 |             let modifiers: NSEventModifierFlags = msg_send![class!(NSEvent), modifierFlags];
     |                            ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1064:46
     |
1064 |             let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
     |                                              ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1065:42
     |
1065 |             let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
     |                                          ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1066:44
     |
1066 |             let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
     |                                            ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1067:46
     |
1067 |             let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
     |                                              ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1068:47
     |
1068 |             let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
     |                                               ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1082:28
     |
1082 |             let modifiers: NSEventModifierFlags = msg_send![class!(NSEvent), modifierFlags];
     |                            ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSEventModifierFlags`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1085:40
     |
1085 |                 on: modifiers.contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
     |                                        ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1131:24
     |
1131 |             let alert: id = msg_send![class!(NSAlert), alloc];
     |                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1132:24
     |
1132 |             let alert: id = msg_send![alert, init];
     |                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1149:29
     |
1149 |                 let button: id = msg_send![alert, addButtonWithTitle: ns_string(answer.label())];
     |                             ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1150:61
     |
1150 |                 let _: () = msg_send![button, setTag: ix as NSInteger];
     |                                                             ^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1161:29
     |
1161 |                 let button: id = msg_send![alert, addButtonWithTitle: ns_string(answer.label())];
     |                             ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1162:61
     |
1162 |                 let _: () = msg_send![button, setTag: ix as NSInteger];
     |                                                             ^^^^^^^^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1167:58
     |
1167 |             let block = ConcreteBlock::new(move |answer: NSInteger| {
     |                                                          ^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1195:73
     |
1195 |                     let _: () = msg_send![window, makeKeyAndOrderFront: nil];
     |                                                                         ^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1212:38
     |
1212 |             let app = NSApplication::sharedApplication(nil);
     |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1212:56
     |
1212 |             let app = NSApplication::sharedApplication(nil);
     |                                                        ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1223:24
     |
1223 |             let title: id = msg_send![self.0.lock().native_window, title];
     |                        ^^

warning: use of deprecated associated function `cocoa::appkit::NSColor::colorWithSRGBRed_green_blue_alpha_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1243:26
     |
1243 |                 NSColor::colorWithSRGBRed_green_blue_alpha_(nil, 0f64, 0f64, 0f64, 1f64)
     |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1243:61
     |
1243 |                 NSColor::colorWithSRGBRed_green_blue_alpha_(nil, 0f64, 0f64, 0f64, 1f64)
     |                                                             ^^^

warning: use of deprecated associated function `cocoa::appkit::NSColor::colorWithSRGBRed_green_blue_alpha_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1246:26
     |
1246 |                 NSColor::colorWithSRGBRed_green_blue_alpha_(nil, 0f64, 0f64, 0f64, 0.0001)
     |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1246:61
     |
1246 |                 NSColor::colorWithSRGBRed_green_blue_alpha_(nil, 0f64, 0f64, 0f64, 0.0001)
     |                                                             ^^^

warning: use of deprecated static `cocoa::appkit::NSAppKitVersionNumber`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1250:16
     |
1250 |             if NSAppKitVersionNumber < NSAppKitVersionNumber12_0 {
     |                ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSAppKitVersionNumber12_0`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1250:40
     |
1250 |             if NSAppKitVersionNumber < NSAppKitVersionNumber12_0 {
     |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::removeFromSuperview`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1268:33
     |
1268 |                         NSView::removeFromSuperview(blur_view);
     |                                 ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::bounds`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1273:41
     |
1273 |                     let frame = NSView::bounds(content_view);
     |                                         ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1274:40
     |
1274 |                     let mut blur_view: id = msg_send![BLURRED_VIEW_CLASS, alloc];
     |                                        ^^

warning: use of deprecated method `cocoa::appkit::NSView::initWithFrame_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1275:41
     |
1275 |                     blur_view = NSView::initWithFrame_(blur_view, frame);
     |                                         ^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewWidthSizable`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1276:52
     |
1276 |                     blur_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
     |                                                    ^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::appkit::NSViewHeightSizable`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1276:73
     |
1276 |                     blur_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
     |                                                                         ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowOrderingMode`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1281:37
     |
1281 |                         positioned: NSWindowOrderingMode::NSWindowBelow
     |                                     ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1282:37
     |
1282 |                         relativeTo: nil
     |                                     ^^^

warning: use of deprecated associated function `cocoa::appkit::NSApplication::sharedApplication`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1307:46
     |
1307 |                     let app = NSApplication::sharedApplication(nil);
     |                                              ^^^^^^^^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1307:64
     |
1307 |                     let app = NSApplication::sharedApplication(nil);
     |                                                                ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1317:33
     |
1317 |             window.miniaturize_(nil);
     |                                 ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1327:34
     |
1327 |                     window.zoom_(nil);
     |                                  ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1339:46
     |
1339 |                     window.toggleFullScreen_(nil);
     |                                              ^^^

warning: use of deprecated struct `cocoa::appkit::NSWindowStyleMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1352:27
     |
1352 |                 .contains(NSWindowStyleMask::NSFullScreenWindowMask)
     |                           ^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1395:26
     |
1395 |             let windows: id = msg_send![self.0.lock().native_window, tabbedWindows];
     |                          ^^

warning: use of deprecated type alias `cocoa::foundation::NSUInteger`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1400:24
     |
1400 |             let count: NSUInteger = msg_send![windows, count];
     |                        ^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1403:29
     |
1403 |                 let window: id = msg_send![windows, objectAtIndex:i];
     |                             ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1406:32
     |
1406 |                     let title: id = msg_send![window, title];
     |                                ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1419:28
     |
1419 |             let tab_group: id = msg_send![self.0.lock().native_window, tabGroup];
     |                            ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1467:40
     |
1467 |                     let input_context: id =
     |                                        ^^

warning: use of deprecated associated function `cocoa::foundation::NSUserDefaults::standardUserDefaults`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1484:56
     |
1484 |                     let defaults: id = NSUserDefaults::standardUserDefaults();
     |                                                        ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1484:35
     |
1484 |                     let defaults: id = NSUserDefaults::standardUserDefaults();
     |                                   ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1485:44
     |
1485 |                     let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
     |                                            ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1485:50
     |
1485 |                     let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
     |                                                  ^^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1486:41
     |
1486 |                     let key = NSString::alloc(nil).init_str("AppleActionOnDoubleClick");
     |                                         ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1486:47
     |
1486 |                     let key = NSString::alloc(nil).init_str("AppleActionOnDoubleClick");
     |                                               ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1488:31
     |
1488 |                     let dict: id = msg_send![defaults, persistentDomainForName: domain];
     |                               ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1492:25
     |
1492 |                         nil
     |                         ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1489:33
     |
1489 |                     let action: id = if !dict.is_null() {
     |                                 ^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1496:50
     |
1496 |                         CStr::from_ptr(NSString::UTF8String(action)).to_string_lossy()
     |                                                  ^^^^^^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1503:49
     |
1503 | ...                   window.miniaturize_(nil);
     |                                           ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1506:42
     |
1506 | ...                   window.zoom_(nil);
     |                                    ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1510:42
     |
1510 | ...                   window.zoom_(nil);
     |                                    ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
    --> crates/gpui/src/platform/mac/window.rs:1513:42
     |
1513 | ...                   window.zoom_(nil);
     |                                    ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window.rs:98:33
   |
98 |     fn CGSMainConnectionID() -> id;
   |                                 ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/gpui/src/platform/mac/window.rs:100:24
    |
100 |         connection_id: id,
    |                        ^^

warning: use of deprecated type alias `cocoa::foundation::NSInteger`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:101:20
    |
101 |         window_id: NSInteger,
    |                    ^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSAppearanceNameVibrantDark`: use the objc2-app-kit crate instead
 --> crates/gpui/src/platform/mac/window_appearance.rs:3:14
  |
3 |     appkit::{NSAppearanceNameVibrantDark, NSAppearanceNameVibrantLight},
  |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSAppearanceNameVibrantLight`: use the objc2-app-kit crate instead
 --> crates/gpui/src/platform/mac/window_appearance.rs:3:43
  |
3 |     appkit::{NSAppearanceNameVibrantDark, NSAppearanceNameVibrantLight},
  |                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
 --> crates/gpui/src/platform/mac/window_appearance.rs:4:11
  |
4 |     base::id,
  |           ^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
 --> crates/gpui/src/platform/mac/window_appearance.rs:5:17
  |
5 |     foundation::NSString,
  |                 ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:11:50
   |
11 |     pub(crate) unsafe fn from_native(appearance: id) -> Self {
   |                                                  ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:12:19
   |
12 |         let name: id = msg_send![appearance, name];
   |                   ^^

warning: use of deprecated static `cocoa::appkit::NSAppearanceNameVibrantLight`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:14:24
   |
14 |             if name == NSAppearanceNameVibrantLight {
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated static `cocoa::appkit::NSAppearanceNameVibrantDark`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:16:31
   |
16 |             } else if name == NSAppearanceNameVibrantDark {
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:35:38
   |
35 |     pub static NSAppearanceNameAqua: id;
   |                                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:36:42
   |
36 |     pub static NSAppearanceNameDarkAqua: id;
   |                                          ^^

   Compiling zlog v0.1.0 (/Volumes/ExternalData/Library/Git/zed/crates/zlog)
   Compiling settings_ui_macros v0.1.0 (/Volumes/ExternalData/Library/Git/zed/crates/settings_ui_macros)
   Compiling serde_path_to_error v0.1.17
   Compiling ec4rs v1.2.0
   Compiling pem-rfc7468 v0.7.0
warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/display.rs:38:62
   |
38 |             let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
   |                                                              ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSDictionary::objectForKey_`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/display.rs:39:52
   |
39 |             let screen_number = device_description.objectForKey_(screen_number_key);
   |                                                    ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::modifierFlags`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:86:38
   |
86 |         let modifiers = native_event.modifierFlags();
   |                                      ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:87:33
   |
87 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
   |                                 ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSControlKeyMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:87:64
   |
87 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
   |                                                                ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:88:29
   |
88 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
   |                             ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlternateKeyMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:88:60
   |
88 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
   |                                                            ^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:89:31
   |
89 |         let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
   |                               ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSShiftKeyMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:89:62
   |
89 |         let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
   |                                                              ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:90:33
   |
90 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
   |                                 ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSCommandKeyMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:90:64
   |
90 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
   |                                                                ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:91:34
   |
91 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
   |                                  ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSFunctionKeyMask`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/events.rs:91:65
   |
91 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
   |                                                                 ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::eventType`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:109:43
    |
109 |             let event_type = native_event.eventType();
    |                                           ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::modifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:126:34
    |
126 | ...                   .modifierFlags()
    |                        ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:127:34
    |
127 | ...                   .contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
    |                        ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlphaShiftKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:127:65
    |
127 | ...                   .contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
    |                                                       ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::isARepeat`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:133:43
    |
133 |                     is_held: native_event.isARepeat() == YES,
    |                                           ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::buttonNumber`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:141:53
    |
141 |                     let button = match native_event.buttonNumber() {
    |                                                     ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:154:49
    |
154 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:154:36
    |
154 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:156:65
    |
156 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:156:52
    |
156 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::clickCount`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:159:55
    |
159 | ...                   click_count: native_event.clickCount() as usize,
    |                                                 ^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::buttonNumber`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:167:53
    |
167 |                     let button = match native_event.buttonNumber() {
    |                                                     ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:181:49
    |
181 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:181:36
    |
181 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:182:65
    |
182 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:182:52
    |
182 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::clickCount`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:185:55
    |
185 | ...                   click_count: native_event.clickCount() as usize,
    |                                                 ^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::phase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:191:67
    |
191 |                     let navigation_direction = match native_event.phase() {
    |                                                                   ^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventPhase::NSEventPhaseEnded`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:192:39
    |
192 |                         NSEventPhase::NSEventPhaseEnded => match native_event.deltaX() {
    |                                       ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::deltaX`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:192:79
    |
192 |                         NSEventPhase::NSEventPhaseEnded => match native_event.deltaX() {
    |                                                                               ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:205:53
    |
205 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:205:40
    |
205 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:206:69
    |
206 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:206:56
    |
206 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::phase`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:217:52
    |
217 |                     let phase = match native_event.phase() {
    |                                                    ^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventPhase::NSEventPhaseMayBegin`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:218:39
    |
218 |                         NSEventPhase::NSEventPhaseMayBegin | NSEventPhase::NSEventPhaseBegan => {
    |                                       ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventPhase::NSEventPhaseBegan`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:218:76
    |
218 |                         NSEventPhase::NSEventPhaseMayBegin | NSEventPhase::NSEventPhaseBegan => {
    |                                                                            ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventPhase::NSEventPhaseEnded`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:221:39
    |
221 |                         NSEventPhase::NSEventPhaseEnded => TouchPhase::Ended,
    |                                       ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::scrollingDeltaX`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:226:38
    |
226 |                         native_event.scrollingDeltaX() as f32,
    |                                      ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::scrollingDeltaY`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:227:38
    |
227 |                         native_event.scrollingDeltaY() as f32,
    |                                      ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::hasPreciseScrollingDeltas`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:230:49
    |
230 |                     let delta = if native_event.hasPreciseScrollingDeltas() == YES {
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:238:45
    |
238 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:238:32
    |
238 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:239:61
    |
239 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:239:48
    |
239 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::buttonNumber`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:249:61
    |
249 |                     let pressed_button = match native_event.buttonNumber() {
    |                                                             ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:263:49
    |
263 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:263:36
    |
263 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:264:65
    |
264 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:264:52
    |
264 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:273:45
    |
273 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:273:32
    |
273 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:274:61
    |
274 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:274:48
    |
274 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:283:45
    |
283 | ...                   px(native_event.locationInWindow().x as f32),
    |                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:283:32
    |
283 | ...                   px(native_event.locationInWindow().x as f32),
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::locationInWindow`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:284:61
    |
284 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                                       ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/events.rs:284:48
    |
284 | ...                   window_height - px(native_event.locationInWindow().y as f32),
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::charactersIgnoringModifiers`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:302:14
    |
302 |             .charactersIgnoringModifiers()
    |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::modifierFlags`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:307:38
    |
307 |         let modifiers = native_event.modifierFlags();
    |                                      ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:309:33
    |
309 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
    |                                 ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSControlKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:309:64
    |
309 |         let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
    |                                                                ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:310:29
    |
310 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
    |                             ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlternateKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:310:60
    |
310 |         let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
    |                                                            ^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:311:35
    |
311 |         let mut shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
    |                                   ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSShiftKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:311:66
    |
311 |         let mut shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
    |                                                                  ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:312:33
    |
312 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
    |                                 ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSCommandKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:312:64
    |
312 |         let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
    |                                                                ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:313:34
    |
313 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask)
    |                                  ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSFunctionKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:313:65
    |
313 |         let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask)
    |                                                                 ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::keyCode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:393:57
    |
393 |                     chars_for_modified_key(native_event.keyCode(), NO_MOD);
    |                                                         ^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::keyCode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:395:57
    |
395 |                     chars_for_modified_key(native_event.keyCode(), SHIFT_MOD);
    |                                                         ^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::keyCode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:400:78
    |
400 |                     let chars_with_cmd = chars_for_modified_key(native_event.keyCode(), CMD_MOD);
    |                                                                              ^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::keyCode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:402:61
    |
402 |                         chars_for_modified_key(native_event.keyCode(), CMD_MOD | SHIFT_MOD);
    |                                                             ^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::keyCode`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/events.rs:426:73
    |
426 |                     key_char = Some(chars_for_modified_key(native_event.keyCode(), mods));
    |                                                                         ^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:198:59
    |
198 |     let screen_number_key = unsafe { NSString::alloc(nil).init_str("NSScreenNumber") };
    |                                                           ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:246:38
    |
246 |                 for i in 0..displays.count() {
    |                                      ^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/screen_capture.rs:247:44
    |
247 |                     let display = displays.objectAtIndex(i);
    |                                            ^^^^^^^^^^^^^

   Compiling by_address v1.2.1
warning: use of deprecated associated constant `cocoa::quartzcore::AutoresizingMask::WIDTH_SIZABLE`: use the objc2-quartz-core crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:152:56
    |
152 |                 setAutoresizingMask: AutoresizingMask::WIDTH_SIZABLE
    |                                                        ^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::quartzcore::AutoresizingMask::HEIGHT_SIZABLE`: use the objc2-quartz-core crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:153:41
    |
153 |                     | AutoresizingMask::HEIGHT_SIZABLE
    |                                         ^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:300:13
    |
300 |             width: size.width.0 as f64,
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:301:13
    |
301 |             height: size.height.0 as f64,
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:310:33
    |
310 |             width: DevicePixels(size.width as i32),
    |                                 ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/metal_renderer.rs:311:34
    |
311 |             height: DevicePixels(size.height as i32),
    |                                  ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::dataForType`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:223:35
    |
223 |             let data = pasteboard.dataForType(kind);
    |                                   ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::bytes`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:228:26
    |
228 |                     data.bytes() as *mut u8,
    |                          ^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::length`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:229:26
    |
229 |                     data.length() as usize,
    |                          ^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:243:53
    |
243 |             let application_menu = NSMenu::new(nil).autorelease();
    |                                                     ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:244:30
    |
244 |             application_menu.setDelegate_(delegate);
    |                              ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:247:45
    |
247 |                 let menu = NSMenu::new(nil).autorelease();
    |                                             ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitle_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:249:22
    |
249 |                 menu.setTitle_(menu_title);
    |                      ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:250:22
    |
250 |                 menu.setDelegate_(delegate);
    |                      ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenu::addItem_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:253:26
    |
253 |                     menu.addItem_(Self::create_menu_item(
    |                          ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:261:54
    |
261 |                 let menu_item = NSMenuItem::new(nil).autorelease();
    |                                                      ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitle_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:262:27
    |
262 |                 menu_item.setTitle_(menu_title);
    |                           ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::setSubmenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:263:27
    |
263 |                 menu_item.setSubmenu_(menu);
    |                           ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenu::addItem_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:264:34
    |
264 |                 application_menu.addItem_(menu_item);
    |                                  ^^^^^^^^

   Compiling palette v0.7.6
warning: use of deprecated method `cocoa::appkit::NSApplication::setWindowsMenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:268:25
    |
268 |                     app.setWindowsMenu_(menu);
    |                         ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:285:23
    |
285 |             dock_menu.setDelegate_(delegate);
    |                       ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenu::addItem_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:287:27
    |
287 |                 dock_menu.addItem_(Self::create_menu_item(
    |                           ^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::empty`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:354:66
    |
354 | ...                   let mut mask = NSEventModifierFlags::empty();
    |                                                            ^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSCommandKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:358:59
    |
358 | ...                   NSEventModifierFlags::NSCommandKeyMask,
    |                                             ^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSControlKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:362:59
    |
362 | ...                   NSEventModifierFlags::NSControlKeyMask,
    |                                             ^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlternateKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:366:59
    |
366 | ...                   NSEventModifierFlags::NSAlternateKeyMask,
    |                                             ^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSShiftKeyMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:370:59
    |
370 | ...                   NSEventModifierFlags::NSShiftKeyMask,
    |                                             ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::initWithTitle_action_keyEquivalent_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:379:34
    |
379 | ...                   .initWithTitle_action_keyEquivalent_(
    |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:384:34
    |
384 | ...                   .autorelease();
    |                        ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::setKeyEquivalentModifierMask_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:388:34
    |
388 | ...                   item.setKeyEquivalentModifierMask_(mask);
    |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::initWithTitle_action_keyEquivalent_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:391:34
    |
391 | ...                   .initWithTitle_action_keyEquivalent_(
    |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:396:34
    |
396 | ...                   .autorelease();
    |                        ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::initWithTitle_action_keyEquivalent_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:400:30
    |
400 | ...                   .initWithTitle_action_keyEquivalent_(
    |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:405:30
    |
405 | ...                   .autorelease();
    |                        ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:414:53
    |
414 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                                     ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:415:52
    |
415 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                                    ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:416:29
    |
416 |                     submenu.setDelegate_(delegate);
    |                             ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenu::addItem_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:418:33
    |
418 |                         submenu.addItem_(Self::create_menu_item(item, delegate, actions, keymap));
    |                                 ^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::setSubmenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:420:26
    |
420 |                     item.setSubmenu_(submenu);
    |                          ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitle_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:421:26
    |
421 |                     item.setTitle_(ns_string(name));
    |                          ^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:425:53
    |
425 |                     let item = NSMenuItem::new(nil).autorelease();
    |                                                     ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:426:52
    |
426 |                     let submenu = NSMenu::new(nil).autorelease();
    |                                                    ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:427:29
    |
427 |                     submenu.setDelegate_(delegate);
    |                             ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSMenuItem::setSubmenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:428:26
    |
428 |                     item.setSubmenu_(submenu);
    |                          ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitle_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:429:26
    |
429 |                     item.setTitle_(ns_string(name));
    |                          ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSApplication::setServicesMenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:434:33
    |
434 | ...                   app.setServicesMenu_(item);
    |                           ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSProcessInfo::operatingSystemVersion`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:447:26
    |
447 |             process_info.operatingSystemVersion()
    |                          ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::majorVersion`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:450:13
    |
450 |             version.majorVersion as usize,
    |             ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::minorVersion`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:451:13
    |
451 |             version.minorVersion as usize,
    |             ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::patchVersion`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:452:13
    |
452 |             version.patchVersion as usize,
    |             ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:484:17
    |
484 |             app.setDelegate_(app_delegate);
    |                 ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSApplication::run`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:491:17
    |
491 |             app.run();
    |                 ^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::drain`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:492:18
    |
492 |             pool.drain();
    |                  ^^^^^

warning: use of deprecated method `cocoa::appkit::NSApplication::activateIgnoringOtherApps_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:559:17
    |
559 |             app.activateIgnoringOtherApps_(ignoring_other_apps.to_objc());
    |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSOperatingSystemVersion::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:596:72
    |
596 |         let min_version = cocoa::foundation::NSOperatingSystemVersion::new(12, 3, 0);
    |                                                                        ^^^

warning: use of deprecated method `cocoa::foundation::NSURL::initWithString_`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:642:18
    |
642 |                 .initWithString_(ns_string(url))
    |                  ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:643:18
    |
643 |                 .autorelease();
    |                  ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSOpenPanel::setCanChooseDirectories_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:711:27
    |
711 |                     panel.setCanChooseDirectories_(options.directories.to_objc());
    |                           ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSOpenPanel::setCanChooseFiles_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:712:27
    |
712 |                     panel.setCanChooseFiles_(options.files.to_objc());
    |                           ^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSOpenPanel::setAllowsMultipleSelection_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:713:27
    |
713 |                     panel.setAllowsMultipleSelection_(options.multiple.to_objc());
    |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSSavePanel::setCanCreateDirectories`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:715:27
    |
715 |                     panel.setCanCreateDirectories(true.to_objc());
    |                           ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSOpenPanel::setResolvesAliases_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:716:27
    |
716 |                     panel.setResolvesAliases_(false.to_objc());
    |                           ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSOpenPanel::URLs`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:721:46
    |
721 | ...                   let urls = panel.URLs();
    |                                        ^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:722:46
    |
722 | ...                   for i in 0..urls.count() {
    |                                        ^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:723:48
    |
723 | ...                   let url = urls.objectAtIndex(i);
    |                                      ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSURL::isFileURL`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:724:40
    |
724 | ...                   if url.isFileURL() == YES
    |                              ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSSavePanel::setDirectoryURL`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:766:27
    |
766 |                     panel.setDirectoryURL(url);
    |                           ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSSavePanel::URL`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:777:45
    |
777 | ...                   let url = panel.URL();
    |                                       ^^^

warning: use of deprecated method `cocoa::foundation::NSURL::isFileURL`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/platform.rs:778:36
    |
778 | ...                   if url.isFileURL() == YES {
    |                              ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSSavePanel::URL`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:779:63
    |
779 | ...                   result = ns_url_to_path(panel.URL()).ok().map(|mut result| {
    |                                                     ^^^

warning: use of deprecated method `cocoa::appkit::NSApplication::setMainMenu_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/platform.rs:910:17
    |
910 |             app.setMainMenu_(menu);
    |                 ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::clearContents`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1034:42
     |
1034 |                         state.pasteboard.clearContents();
     |                                          ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1042:70
     |
1042 |                         .init_attributed_string(NSString::alloc(nil).init_str(""));
     |                                                                      ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1048:78
     |
1048 | ...                   .init_attributed_string(NSString::alloc(nil).init_str(&text));
     |                                                                    ^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::clearContents`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1058:34
     |
1058 |                 state.pasteboard.clearContents();
     |                                  ^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSRange::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1063:34
     |
1063 |                         NSRange::new(0, msg_send![attributed_string, length]),
     |                                  ^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1069:30
     |
1069 | ...                   .setData_forType(rtfd_data, NSPasteboardTypeRTFD);
     |                        ^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSRange::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1073:34
     |
1073 |                         NSRange::new(0, attributed_string.length()),
     |                                  ^^^

warning: use of deprecated method `cocoa::foundation::NSData::length`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1073:59
     |
1073 |                         NSRange::new(0, attributed_string.length()),
     |                                                           ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1079:30
     |
1079 | ...                   .setData_forType(rtf_data, NSPasteboardTypeRTF);
     |                        ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setString_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1086:22
     |
1086 |                     .setString_forType(plain_text, NSPasteboardTypeString);
     |                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::types`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1097:40
     |
1097 |             let types: id = pasteboard.types();
     |                                        ^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::dataForType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1101:39
     |
1101 |                 let data = pasteboard.dataForType(string_type);
     |                                       ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::bytes`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1104:32
     |
1104 |                 } else if data.bytes().is_null() {
     |                                ^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::bytes`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1110:52
     |
1110 |                         slice::from_raw_parts(data.bytes() as *mut u8, data.length() as usize);
     |                                                    ^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::length`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1110:77
     |
1110 |                         slice::from_raw_parts(data.bytes() as *mut u8, data.length() as usize);
     |                                                                             ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::clearContents`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1266:30
     |
1266 |             state.pasteboard.clearContents();
     |                              ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1275:18
     |
1275 |                 .setData_forType(text_bytes, NSPasteboardTypeString);
     |                  ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1286:22
     |
1286 |                     .setData_forType(hash_bytes, state.text_hash_pasteboard_type);
     |                      ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1295:22
     |
1295 |                     .setData_forType(metadata_bytes, state.metadata_pasteboard_type);
     |                      ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::clearContents`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1303:30
     |
1303 |             state.pasteboard.clearContents();
     |                              ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::setData_forType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1313:18
     |
1313 |                 .setData_forType(bytes, Into::<UTType>::into(image.format).inner_mut());
     |                  ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::types`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1322:36
     |
1322 |         let types: id = pasteboard.types();
     |                                    ^^^^^

warning: use of deprecated method `cocoa::appkit::NSPasteboard::dataForType`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1324:35
     |
1324 |             let data = pasteboard.dataForType(ut_type.inner_mut());
     |                                   ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::bytes`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1329:26
     |
1329 |                     data.bytes() as *mut u8,
     |                          ^^^^^

warning: use of deprecated method `cocoa::foundation::NSData::length`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1330:26
     |
1330 |                     data.length() as usize,
     |                          ^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1346:31
     |
1346 |     let bytes = unsafe { path.UTF8String() as *const u8 };
     |                               ^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSApplication::setActivationPolicy_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1362:13
     |
1362 |         app.setActivationPolicy_(NSApplicationActivationPolicyRegular);
     |             ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::count`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1421:18
     |
1421 |         (0..urls.count())
     |                  ^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1423:32
     |
1423 |                 let url = urls.objectAtIndex(i);
     |                                ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSURL::absoluteString`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1424:42
     |
1424 |                 match CStr::from_ptr(url.absoluteString().UTF8String() as *mut c_char).to_str() {
     |                                          ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1424:59
     |
1424 |                 match CStr::from_ptr(url.absoluteString().UTF8String() as *mut c_char).to_str() {
     |                                                           ^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1508:35
     |
1508 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
     |                                   ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1508:52
     |
1508 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
     |                                                    ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSURL::absoluteString`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1514:28
     |
1514 |         CStr::from_ptr(url.absoluteString().UTF8String()).to_string_lossy()
     |                            ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/platform.rs:1514:45
     |
1514 |         CStr::from_ptr(url.absoluteString().UTF8String()).to_string_lossy()
     |                                             ^^^^^^^^^^

warning: use of deprecated associated function `cocoa::appkit::_::<impl cocoa::appkit::NSWindowStyleMask>::from_bits_retain`: use the objc2-app-kit crate instead
  --> crates/gpui/src/platform/mac/window.rs:65:24
   |
65 |     NSWindowStyleMask::from_bits_retain(1 << 7);
   |                        ^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:275:12
    |
275 |         px(position.x as f32),
    |            ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:277:28
    |
277 |         window_height - px(position.y as f32),
    |                            ^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::occlusionState`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:481:18
    |
481 |                 .occlusionState()
    |                  ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowOcclusionState>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:482:18
    |
482 |                 .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
    |                  ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowOcclusionState::NSWindowOcclusionStateVisible`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:482:51
    |
482 |                 .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
    |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::screen`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:487:76
    |
487 |         let display_id = unsafe { display_id_for_screen(self.native_window.screen()) };
    |                                                                            ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::screen`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:503:50
    |
503 |             let screen_size = self.native_window.screen().visibleFrame().into();
    |                                                  ^^^^^^

warning: use of deprecated method `cocoa::appkit::NSScreen::visibleFrame`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:503:59
    |
503 |             let screen_size = self.native_window.screen().visibleFrame().into();
    |                                                           ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::styleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:510:49
    |
510 |             let style_mask = self.native_window.styleMask();
    |                                                 ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowStyleMask>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:511:24
    |
511 |             style_mask.contains(NSWindowStyleMask::NSFullScreenWindowMask)
    |                        ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullScreenWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:511:52
    |
511 |             style_mask.contains(NSWindowStyleMask::NSFullScreenWindowMask)
    |                                                    ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:523:9
    |
523 |         window_frame.origin.y =
    |         ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:523:9
    |
523 |         window_frame.origin.y =
    |         ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:13
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |             ^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:13
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |             ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:40
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |                                        ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:40
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |                                        ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:64
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |                                                                ^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:524:64
    |
524 |             screen_frame.size.height - window_frame.origin.y - window_frame.size.height;
    |                                                                ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:528:21
    |
528 |                 px((window_frame.origin.x - screen_frame.origin.x) as f32),
    |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:528:21
    |
528 |                 px((window_frame.origin.x - screen_frame.origin.x) as f32),
    |                     ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:528:45
    |
528 |                 px((window_frame.origin.x - screen_frame.origin.x) as f32),
    |                                             ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:528:45
    |
528 |                 px((window_frame.origin.x - screen_frame.origin.x) as f32),
    |                                             ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:529:21
    |
529 |                 px((window_frame.origin.y + screen_frame.origin.y) as f32),
    |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:529:21
    |
529 |                 px((window_frame.origin.y + screen_frame.origin.y) as f32),
    |                     ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:529:45
    |
529 |                 px((window_frame.origin.y + screen_frame.origin.y) as f32),
    |                                             ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:529:45
    |
529 |                 px((window_frame.origin.y + screen_frame.origin.y) as f32),
    |                                             ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:532:20
    |
532 |                 px(window_frame.size.width as f32),
    |                    ^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:532:20
    |
532 |                 px(window_frame.size.width as f32),
    |                    ^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:533:20
    |
533 |                 px(window_frame.size.height as f32),
    |                    ^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:533:20
    |
533 |                 px(window_frame.size.height as f32),
    |                    ^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::contentView`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:540:55
    |
540 |             unsafe { NSView::frame(self.native_window.contentView()) }.size;
    |                                                       ^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:540:13
    |
540 |             unsafe { NSView::frame(self.native_window.contentView()) }.size;
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:539:22
    |
539 |         let NSSize { width, height, .. } =
    |                      ^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:539:29
    |
539 |         let NSSize { width, height, .. } =
    |                             ^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:552:17
    |
552 |             px((frame.size.height - content_layout_rect.size.height) as f32)
    |                 ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:552:17
    |
552 |             px((frame.size.height - content_layout_rect.size.height) as f32)
    |                 ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSClosableWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:601:40
    |
601 |                     NSWindowStyleMask::NSClosableWindowMask | NSWindowStyleMask::NSTitledWindowMask;
    |                                        ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSTitledWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:601:82
    |
601 |                     NSWindowStyleMask::NSClosableWindowMask | NSWindowStyleMask::NSTitledWindowMask;
    |                                                                                  ^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSResizableWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:604:54
    |
604 |                     style_mask |= NSWindowStyleMask::NSResizableWindowMask;
    |                                                      ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSMiniaturizableWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:608:54
    |
608 |                     style_mask |= NSWindowStyleMask::NSMiniaturizableWindowMask;
    |                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullSizeContentViewWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:612:54
    |
612 |                     style_mask |= NSWindowStyleMask::NSFullSizeContentViewWindowMask;
    |                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSTitledWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:615:49
    |
615 |                 style_mask = NSWindowStyleMask::NSTitledWindowMask
    |                                                 ^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullSizeContentViewWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:616:42
    |
616 |                     | NSWindowStyleMask::NSFullSizeContentViewWindowMask;
    |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSRect::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:652:39
    |
652 |             let window_rect = NSRect::new(
    |                                       ^^^

warning: use of deprecated associated function `cocoa::foundation::NSPoint::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:653:26
    |
653 |                 NSPoint::new(
    |                          ^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:654:21
    |
654 |                     screen_frame.origin.x + bounds.origin.x.0 as f64,
    |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:654:21
    |
654 |                     screen_frame.origin.x + bounds.origin.x.0 as f64,
    |                     ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:655:21
    |
655 |                     screen_frame.origin.y
    |                     ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:655:21
    |
655 |                     screen_frame.origin.y
    |                     ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSSize::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:658:25
    |
658 |                 NSSize::new(bounds.size.width.0 as f64, bounds.size.height.0 as f64),
    |                         ^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::initWithContentRect_styleMask_backing_defer_screen_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:661:47
    |
661 |             let native_window = native_window.initWithContentRect_styleMask_backing_defer_screen_(
    |                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::contentView`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:679:46
    |
679 |             let content_view = native_window.contentView();
    |                                              ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:732:27
    |
732 |             native_window.setDelegate_(native_window);
    |                           ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setMovable_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:745:27
    |
745 |             native_window.setMovable_(is_movable as BOOL);
    |                           ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setContentMinSize_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:748:31
    |
748 |                 native_window.setContentMinSize_(NSSize {
    |                               ^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:749:21
    |
749 |                     width: window_min_size.width.to_f64(),
    |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:750:21
    |
750 |                     height: window_min_size.height.to_f64(),
    |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitlebarAppearsTransparent_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:755:31
    |
755 |                 native_window.setTitlebarAppearsTransparent_(YES);
    |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitleVisibility_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:756:31
    |
756 |                 native_window.setTitleVisibility_(NSWindowTitleVisibility::NSWindowTitleHidden);
    |                               ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::setAutoresizingMask_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:759:25
    |
759 |             native_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
    |                         ^^^^^^^^^^^^^^^^^^^^

   Compiling palette_derive v0.7.6
warning: use of deprecated method `cocoa::appkit::NSView::setWantsBestResolutionOpenGLSurface_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:760:25
    |
760 |             native_view.setWantsBestResolutionOpenGLSurface_(YES);
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::setWantsLayer`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:767:25
    |
767 |             native_view.setWantsLayer(YES);
    |                         ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::addSubview_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:773:26
    |
773 |             content_view.addSubview_(native_view.autorelease());
    |                          ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:773:50
    |
773 |             content_view.addSubview_(native_view.autorelease());
    |                                                  ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::makeFirstResponder_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:774:27
    |
774 |             native_window.makeFirstResponder_(native_view);
    |                           ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setLevel_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:778:35
    |
778 |                     native_window.setLevel_(NSNormalWindowLevel);
    |                                   ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setAcceptsMouseMovedEvents_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:779:35
    |
779 |                     native_window.setAcceptsMouseMovedEvents_(YES);
    |                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:782:63
    |
782 |                         let tabbing_id = NSString::alloc(nil).init_str(tabbing_identifier.as_str());
    |                                                               ^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSRect::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:47
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                               ^^^

warning: use of deprecated associated function `cocoa::foundation::NSPoint::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:60
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                                            ^^^

warning: use of deprecated associated function `cocoa::foundation::NSSize::new`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:793:81
    |
793 |                         initWithRect: NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.))
    |                                                                                 ^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:799:79
    |
799 |                         msg_send![native_view, addTrackingArea: tracking_area.autorelease()];
    |                                                                               ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setLevel_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:801:35
    |
801 |                     native_window.setLevel_(NSPopUpWindowLevel);
    |                                   ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setCollectionBehavior_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:806:35
    |
806 |                     native_window.setCollectionBehavior_(
    |                                   ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowCollectionBehavior::NSWindowCollectionBehaviorCanJoinAllSpaces`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:807:53
    |
807 |                         NSWindowCollectionBehavior::NSWindowCollectionBehaviorCanJoinAllSpaces |
    |                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowCollectionBehavior::NSWindowCollectionBehaviorFullScreenAuxiliary`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:808:53
    |
808 |                         NSWindowCollectionBehavior::NSWindowCollectionBehaviorFullScreenAuxiliary
    |                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::styleMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:820:22
    |
820 |                     .styleMask()
    |                      ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowStyleMask>::contains`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:821:22
    |
821 |                     .contains(NSWindowStyleMask::NSFullScreenWindowMask);
    |                      ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullScreenWindowMask`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:821:50
    |
821 |                     .contains(NSWindowStyleMask::NSFullScreenWindowMask);
    |                                                  ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowOrderingMode::NSWindowAbove`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:834:122
    |
834 | ...   let _: () = msg_send![main_window, addTabbedWindow: native_window ordered: NSWindowOrderingMode::NSWindowAbove];
    |                                                                                                        ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::makeKeyAndOrderFront_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:846:31
    |
846 |                 native_window.makeKeyAndOrderFront_(nil);
    |                               ^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::orderFront_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:848:31
    |
848 |                 native_window.orderFront_(nil);
    |                               ^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:855:60
    |
855 |             NSWindow::setFrameTopLeftPoint_(native_window, window_rect.origin);
    |                                                            ^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::drain`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:858:18
    |
858 |             pool.drain();
    |                  ^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:903:47
    |
903 |             let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
    |                                               ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:904:44
    |
904 |             let key = NSString::alloc(nil).init_str("AppleWindowTabbingMode");
    |                                            ^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setDelegate_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:935:32
    |
935 |             this.native_window.setDelegate_(nil);
    |                                ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::close`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:941:28
    |
941 |                     window.close();
    |                            ^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:942:28
    |
942 |                     window.autorelease();
    |                            ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setContentSize_`: use the objc2-app-kit crate instead
   --> crates/gpui/src/platform/mac/window.rs:972:28
    |
972 |                     window.setContentSize_(NSSize {
    |                            ^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:973:25
    |
973 |                         width: size.width.0 as f64,
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac/window.rs:974:25
    |
974 |                         height: size.height.0 as f64,
    |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::screen`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1034:54
     |
1034 |             let screen = self.0.lock().native_window.screen();
     |                                                      ^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1041:38
     |
1041 |                 NSString::alloc(nil).init_str("NSScreenNumber"),
     |                                      ^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::mouseLocationOutsideOfEventStream`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1055:18
     |
1055 |                 .mouseLocationOutsideOfEventStream()
     |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1064:37
     |
1064 |             let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
     |                                     ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSControlKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1064:68
     |
1064 |             let control = modifiers.contains(NSEventModifierFlags::NSControlKeyMask);
     |                                                                    ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1065:33
     |
1065 |             let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
     |                                 ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlternateKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1065:64
     |
1065 |             let alt = modifiers.contains(NSEventModifierFlags::NSAlternateKeyMask);
     |                                                                ^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1066:35
     |
1066 |             let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
     |                                   ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSShiftKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1066:66
     |
1066 |             let shift = modifiers.contains(NSEventModifierFlags::NSShiftKeyMask);
     |                                                                  ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1067:37
     |
1067 |             let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
     |                                     ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSCommandKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1067:68
     |
1067 |             let command = modifiers.contains(NSEventModifierFlags::NSCommandKeyMask);
     |                                                                    ^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1068:38
     |
1068 |             let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
     |                                      ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSFunctionKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1068:69
     |
1068 |             let function = modifiers.contains(NSEventModifierFlags::NSFunctionKeyMask);
     |                                                                     ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSEventModifierFlags>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1085:31
     |
1085 |                 on: modifiers.contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
     |                               ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSEventModifierFlags::NSAlphaShiftKeyMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1085:62
     |
1085 |                 on: modifiers.contains(NSEventModifierFlags::NSAlphaShiftKeyMask),
     |                                                              ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::isKeyWindow`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1202:46
     |
1202 |         unsafe { self.0.lock().native_window.isKeyWindow() == YES }
     |                                              ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setOpaque_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1241:32
     |
1241 |             this.native_window.setOpaque_(opaque as BOOL);
     |                                ^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setBackgroundColor_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1248:32
     |
1248 |             this.native_window.setBackgroundColor_(background_color);
     |                                ^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSEvent::windowNumber`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1260:56
     |
1260 |                 let window_number = this.native_window.windowNumber();
     |                                                        ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::contentView`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1272:59
     |
1272 |                     let content_view = this.native_window.contentView();
     |                                                           ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSView::setAutoresizingMask_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1276:31
     |
1276 |                     blur_view.setAutoresizingMask_(NSViewWidthSizable | NSViewHeightSizable);
     |                               ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowOrderingMode::NSWindowBelow`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1281:59
     |
1281 |                         positioned: NSWindowOrderingMode::NSWindowBelow
     |                                                           ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1284:56
     |
1284 |                     this.blurred_view = Some(blur_view.autorelease());
     |                                                        ^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::miniaturize_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1317:20
     |
1317 |             window.miniaturize_(nil);
     |                    ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::zoom_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1327:28
     |
1327 |                     window.zoom_(nil);
     |                            ^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::toggleFullScreen_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1339:28
     |
1339 |                     window.toggleFullScreen_(nil);
     |                            ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::styleMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1351:18
     |
1351 |                 .styleMask()
     |                  ^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowStyleMask>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1352:18
     |
1352 |                 .contains(NSWindowStyleMask::NSFullScreenWindowMask)
     |                  ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullScreenWindowMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1352:46
     |
1352 |                 .contains(NSWindowStyleMask::NSFullScreenWindowMask)
     |                                              ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1485:55
     |
1485 |                     let domain = NSString::alloc(nil).init_str("NSGlobalDomain");
     |                                                       ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1486:52
     |
1486 |                     let key = NSString::alloc(nil).init_str("AppleActionOnDoubleClick");
     |                                                    ^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::miniaturize_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1503:36
     |
1503 | ...                   window.miniaturize_(nil);
     |                              ^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::zoom_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1506:36
     |
1506 | ...                   window.zoom_(nil);
     |                              ^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::zoom_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1510:36
     |
1510 | ...                   window.zoom_(nil);
     |                              ^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::zoom_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1513:36
     |
1513 | ...                   window.zoom_(nil);
     |                              ^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::occlusionState`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1887:14
     |
1887 |             .occlusionState()
     |              ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowOcclusionState>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1888:14
     |
1888 |             .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
     |              ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowOcclusionState::NSWindowOcclusionStateVisible`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1888:47
     |
1888 |             .contains(NSWindowOcclusionState::NSWindowOcclusionStateVisible)
     |                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSOperatingSystemVersion::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1908:49
     |
1908 |     let min_version = NSOperatingSystemVersion::new(15, 3, 0);
     |                                                 ^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitlebarAppearsTransparent_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1912:32
     |
1912 |             lock.native_window.setTitlebarAppearsTransparent_(NO);
     |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSOperatingSystemVersion::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1921:49
     |
1921 |     let min_version = NSOperatingSystemVersion::new(15, 3, 0);
     |                                                 ^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::setTitlebarAppearsTransparent_`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1925:32
     |
1925 |             lock.native_window.setTitlebarAppearsTransparent_(YES);
     |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSProcessInfo::isOperatingSystemAtLeastVersion`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:1931:46
     |
1931 |     unsafe { NSProcessInfo::processInfo(nil).isOperatingSystemAtLeastVersion(version) }
     |                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::appkit::NSWindow::isKeyWindow`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:1953:49
     |
1953 |     let is_active = unsafe { lock.native_window.isKeyWindow() == YES };
     |                                                 ^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2077:30
     |
2077 |         Size::<Pixels>::from(old_frame.size)
     |                              ^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSRect::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:17
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |                 ^^^

warning: use of deprecated associated function `cocoa::foundation::NSPoint::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:30
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |                              ^^^

warning: use of deprecated associated function `cocoa::foundation::NSSize::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2170:51
     |
2170 |         NSRect::new(NSPoint::new(0., 0.), NSSize::new(0., 0.)),
     |                                                   ^^^

warning: use of deprecated associated function `cocoa::foundation::NSRect::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2172:21
     |
2172 |             NSRect::new(
     |                     ^^^

warning: use of deprecated associated function `cocoa::foundation::NSPoint::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2173:26
     |
2173 |                 NSPoint::new(
     |                          ^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2174:21
     |
2174 |                     frame.origin.x + bounds.origin.x.0 as f64,
     |                     ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2174:21
     |
2174 |                     frame.origin.x + bounds.origin.x.0 as f64,
     |                     ^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2175:21
     |
2175 |                     frame.origin.y + frame.size.height
     |                     ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2175:21
     |
2175 |                     frame.origin.y + frame.size.height
     |                     ^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2175:38
     |
2175 |                     frame.origin.y + frame.size.height
     |                                      ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2175:38
     |
2175 |                     frame.origin.y + frame.size.height
     |                                      ^^^^^^^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSSize::new`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2179:25
     |
2179 |                 NSSize::new(bounds.size.width.0 as f64, bounds.size.height.0 as f64),
     |                         ^^^

warning: use of deprecated method `cocoa::appkit::_::<impl cocoa::appkit::NSWindowStyleMask>::contains`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2192:24
     |
2192 |         if !style_mask.contains(NSWindowStyleMask::NSFullSizeContentViewWindowMask) {
     |                        ^^^^^^^^

warning: use of deprecated associated constant `cocoa::appkit::NSWindowStyleMask::NSFullSizeContentViewWindowMask`: use the objc2-app-kit crate instead
    --> crates/gpui/src/platform/mac/window.rs:2192:52
     |
2192 |         if !style_mask.contains(NSWindowStyleMask::NSFullSizeContentViewWindowMask) {
     |                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2193:13
     |
2193 |             frame.origin.y -= frame.size.height - content_layout_rect.size.height;
     |             ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2193:13
     |
2193 |             frame.origin.y -= frame.size.height - content_layout_rect.size.height;
     |             ^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2193:31
     |
2193 |             frame.origin.y -= frame.size.height - content_layout_rect.size.height;
     |                               ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2193:31
     |
2193 |             frame.origin.y -= frame.size.height - content_layout_rect.size.height;
     |                               ^^^^^^^^^^^^^^^^^

   Compiling der v0.7.10
warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2324:20
     |
2324 |     let window_x = position.x - frame.origin.x;
     |                    ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2324:33
     |
2324 |     let window_x = position.x - frame.origin.x;
     |                                 ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::x`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2324:33
     |
2324 |     let window_x = position.x - frame.origin.x;
     |                                 ^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2325:20
     |
2325 |     let window_y = frame.size.height - (position.y - frame.origin.y);
     |                    ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2325:20
     |
2325 |     let window_y = frame.size.height - (position.y - frame.origin.y);
     |                    ^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2325:41
     |
2325 |     let window_y = frame.size.height - (position.y - frame.origin.y);
     |                                         ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::origin`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2325:54
     |
2325 |     let window_y = frame.size.height - (position.y - frame.origin.y);
     |                                                      ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSPoint::y`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2325:54
     |
2325 |     let window_y = frame.size.height - (position.y - frame.origin.y);
     |                                                      ^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSFastEnumeration::iter`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2383:36
     |
2383 |     for file in unsafe { filenames.iter() } {
     |                                    ^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2458:58
     |
2458 |         let screen_number_key: id = NSString::alloc(nil).init_str("NSScreenNumber");
     |                                                          ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSDictionary::objectForKey_`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2459:48
     |
2459 |         let screen_number = device_description.objectForKey_(screen_number_key);
     |                                                ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::isEqualToString`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2491:23
     |
2491 |         if class_name.isEqualToString("CAChameleonLayer") {
     |                       ^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2504:56
     |
2504 |             let test_string: id = NSString::alloc(nil).init_str("Saturat").autorelease();
     |                                                        ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2504:76
     |
2504 |             let test_string: id = NSString::alloc(nil).init_str("Saturat").autorelease();
     |                                                                            ^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2507:57
     |
2507 |                 let description: id = msg_send![filters.objectAtIndex(i), description];
     |                                                         ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSArray::objectAtIndex`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2530:42
     |
2530 |                 let sublayer = sublayers.objectAtIndex(i);
     |                                          ^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2545:9
     |
2545 |         frame.size.height = 0.0;
     |         ^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
    --> crates/gpui/src/platform/mac/window.rs:2545:9
     |
2545 |         frame.size.height = 0.0;
     |         ^^^^^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac/window_appearance.rs:25:41
   |
25 |                     CStr::from_ptr(name.UTF8String())
   |                                         ^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::UTF8String`: use the objc2-foundation crate instead
  --> crates/gpui/src/platform/mac.rs:78:29
   |
78 |             let cstr = self.UTF8String();
   |                             ^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:139:35
    |
139 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                   ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:139:52
    |
139 |     unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                                    ^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:145:23
    |
145 |             width: px(value.width as f32),
    |                       ^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:146:24
    |
146 |             height: px(value.height as f32),
    |                        ^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:153:40
    |
153 |         let NSSize { width, height } = rect.size;
    |                                        ^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:153:22
    |
153 |         let NSSize { width, height } = rect.size;
    |                      ^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:153:29
    |
153 |         let NSSize { width, height } = rect.size;
    |                             ^^^^^^

warning: use of deprecated field `cocoa::foundation::NSRect::size`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:160:40
    |
160 |         let NSSize { width, height } = rect.size;
    |                                        ^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::width`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:160:22
    |
160 |         let NSSize { width, height } = rect.size;
    |                      ^^^^^

warning: use of deprecated field `cocoa::foundation::NSSize::height`: use the objc2-foundation crate instead
   --> crates/gpui/src/platform/mac.rs:160:29
    |
160 |         let NSSize { width, height } = rect.size;
    |                             ^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:450:20
    |
450 |             base::{id, nil},
    |                    ^^
    |
    = note: `#[warn(deprecated)]` on by default

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:450:24
    |
450 |             base::{id, nil},
    |                        ^^^

warning: use of deprecated trait `cocoa::foundation::NSAutoreleasePool`: use the objc2-foundation crate instead
   --> crates/fs/src/fs.rs:451:26
    |
451 |             foundation::{NSAutoreleasePool, NSString},
    |                          ^^^^^^^^^^^^^^^^^

warning: use of deprecated trait `cocoa::foundation::NSString`: use the objc2-foundation crate instead
   --> crates/fs/src/fs.rs:451:45
    |
451 |             foundation::{NSAutoreleasePool, NSString},
    |                                             ^^^^^^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:456:50
    |
456 |             unsafe fn ns_string(string: &str) -> id {
    |                                                  ^^

warning: use of deprecated associated function `cocoa::foundation::NSString::alloc`: use the objc2-foundation crate instead
   --> crates/fs/src/fs.rs:457:36
    |
457 |                 unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                    ^^^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:457:42
    |
457 |                 unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                          ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:460:22
    |
460 |             let url: id = msg_send![class!(NSURL), fileURLWithPath: ns_string(path.to_string_lossy().as_ref())];
    |                      ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:461:24
    |
461 |             let array: id = msg_send![class!(NSArray), arrayWithObject: url];
    |                        ^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:462:28
    |
462 |             let workspace: id = msg_send![class!(NSWorkspace), sharedWorkspace];
    |                            ^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:464:84
    |
464 |             let _: id = msg_send![workspace, recycleURLs: array completionHandler: nil];
    |                                                                                    ^^^

warning: use of deprecated type alias `cocoa::base::id`: use the objc2 crate instead
   --> crates/fs/src/fs.rs:464:20
    |
464 |             let _: id = msg_send![workspace, recycleURLs: array completionHandler: nil];
    |                    ^^

warning: use of deprecated method `cocoa::foundation::NSString::init_str`: use the objc2-foundation crate instead
   --> crates/fs/src/fs.rs:457:47
    |
457 |                 unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                               ^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSAutoreleasePool::autorelease`: use the objc2-foundation crate instead
   --> crates/fs/src/fs.rs:457:64
    |
457 |                 unsafe { NSString::alloc(nil).init_str(string).autorelease() }
    |                                                                ^^^^^^^^^^^

warning: use of deprecated associated function `cocoa::foundation::NSProcessInfo::processInfo`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:115:66
    |
115 |             let process_info = cocoa::foundation::NSProcessInfo::processInfo(nil);
    |                                                                  ^^^^^^^^^^^
    |
    = note: `#[warn(deprecated)]` on by default

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/client/src/telemetry.rs:115:78
    |
115 |             let process_info = cocoa::foundation::NSProcessInfo::processInfo(nil);
    |                                                                              ^^^

warning: use of deprecated constant `cocoa::base::nil`: use the objc2 crate instead
   --> crates/client/src/telemetry.rs:111:26
    |
111 |         use cocoa::base::nil;
    |                          ^^^

warning: use of deprecated trait `cocoa::foundation::NSProcessInfo`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:112:32
    |
112 |         use cocoa::foundation::NSProcessInfo;
    |                                ^^^^^^^^^^^^^

warning: use of deprecated method `cocoa::foundation::NSProcessInfo::operatingSystemVersion`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:116:40
    |
116 |             let version = process_info.operatingSystemVersion();
    |                                        ^^^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::majorVersion`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:118:17
    |
118 |                 version.majorVersion as usize,
    |                 ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::minorVersion`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:119:17
    |
119 |                 version.minorVersion as usize,
    |                 ^^^^^^^^^^^^^^^^^^^^

warning: use of deprecated field `cocoa::foundation::NSOperatingSystemVersion::patchVersion`: use the objc2-foundation crate instead
   --> crates/client/src/telemetry.rs:120:17
    |
120 |                 version.patchVersion as usize,
    |                 ^^^^^^^^^^^^^^^^^^^^

</end details of warnings>
