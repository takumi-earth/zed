use objc::runtime::Object;
use objc::{class, msg_send, sel, sel_impl};

type ObjcId = *mut Object;

#[repr(C)]
#[derive(Copy, Clone)]
pub struct NSRange {
    pub location: usize,
    pub length: usize,
}

impl NSRange {
    pub const fn new(location: usize, length: usize) -> Self {
        Self { location, length }
    }
}

/// The `cocoa` crate does not define NSAttributedString (and related Cocoa classes),
/// which are needed for copying rich text (that is, text intermingled with images)
/// to the clipboard. This adds access to those APIs.
#[allow(non_snake_case)]
pub trait NSAttributedString: Sized {
    unsafe fn alloc(_: Self) -> ObjcId {
        msg_send![class!(NSAttributedString), alloc]
    }

    unsafe fn init_attributed_string(self, string: ObjcId) -> ObjcId;
    unsafe fn appendAttributedString_(self, attr_string: ObjcId);
    unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: ObjcId) -> ObjcId;
    unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: ObjcId) -> ObjcId;
    unsafe fn string(self) -> ObjcId;
}

impl NSAttributedString for ObjcId {
    unsafe fn init_attributed_string(self, string: ObjcId) -> ObjcId {
        msg_send![self, initWithString: string]
    }

    unsafe fn appendAttributedString_(self, attr_string: ObjcId) {
        let _: () = msg_send![self, appendAttributedString: attr_string];
    }

    unsafe fn RTFDFromRange_documentAttributes_(self, range: NSRange, attrs: ObjcId) -> ObjcId {
        msg_send![self, RTFDFromRange: range documentAttributes: attrs]
    }

    unsafe fn RTFFromRange_documentAttributes_(self, range: NSRange, attrs: ObjcId) -> ObjcId {
        msg_send![self, RTFFromRange: range documentAttributes: attrs]
    }

    unsafe fn string(self) -> ObjcId {
        msg_send![self, string]
    }
}

pub trait NSMutableAttributedString: NSAttributedString {
    unsafe fn alloc(_: Self) -> ObjcId {
        msg_send![class!(NSMutableAttributedString), alloc]
    }
}

impl NSMutableAttributedString for ObjcId {}

#[cfg(test)]
mod tests {
    use super::*;
    use objc::runtime::Object;
    use objc::{class, msg_send, sel, sel_impl};
    use std::ffi::CString;
    #[test]
    #[ignore] // This was SIGSEGV-ing on CI but not locally; need to investigate https://github.com/zed-industries/zed/actions/runs/10362363230/job/28684225486?pr=15782#step:4:1348
    fn test_nsattributed_string() {
        // TODO move these to parent module once it's actually ready to be used
        #[allow(non_snake_case)]
        pub trait NSTextAttachment: Sized {
            unsafe fn alloc(_: Self) -> ObjcId {
                msg_send![class!(NSTextAttachment), alloc]
            }
        }

        impl NSTextAttachment for ObjcId {}

        unsafe {
            let image: ObjcId = msg_send![class!(NSImage), alloc];
            let path = CString::new("test.jpeg").unwrap();
            let ns_str: *mut Object = msg_send![class!(NSString), alloc];
            let ns_str: *mut Object = msg_send![ns_str, initWithUTF8String: path.as_ptr()];
            let _: ObjcId = msg_send![image, initWithContentsOfFile: ns_str];

            let s = CString::new("Test String").unwrap();
            let string: ObjcId = msg_send![class!(NSString), alloc];
            let string: ObjcId = msg_send![string, initWithUTF8String: s.as_ptr()];
            let attr_string = NSMutableAttributedString::alloc(std::ptr::null_mut())
                .init_attributed_string(string);
            let hs = CString::new("Hello World").unwrap();
            let hello_string: ObjcId = msg_send![class!(NSString), alloc];
            let hello_string: ObjcId = msg_send![hello_string, initWithUTF8String: hs.as_ptr()];
            let hello_attr_string = NSAttributedString::alloc(std::ptr::null_mut())
                .init_attributed_string(hello_string);
            attr_string.appendAttributedString_(hello_attr_string);

            let attachment = NSTextAttachment::alloc(std::ptr::null_mut());
            let _: () = msg_send![attachment, setImage: image];
            let image_attr_string =
                msg_send![class!(NSAttributedString), attributedStringWithAttachment: attachment];
            attr_string.appendAttributedString_(image_attr_string);

            let as_ = CString::new("Another String").unwrap();
            let another_string: ObjcId = msg_send![class!(NSString), alloc];
            let another_string: ObjcId =
                msg_send![another_string, initWithUTF8String: as_.as_ptr()];
            let another_attr_string = NSAttributedString::alloc(std::ptr::null_mut())
                .init_attributed_string(another_string);
            attr_string.appendAttributedString_(another_attr_string);

            let _len: u64 = msg_send![attr_string, length];

            ///////////////////////////////////////////////////
            // pasteboard.clearContents();

            let len: u64 = msg_send![attr_string, length];
            let rtfd_data = attr_string.RTFDFromRange_documentAttributes_(
                NSRange::new(0, len as usize),
                std::ptr::null_mut(),
            );
            assert!(!rtfd_data.is_null());
            // if rtfd_data != nil {
            //     pasteboard.setData_forType(rtfd_data, NSPasteboardTypeRTFD);
            // }

            // let rtf_data = attributed_string.RTFFromRange_documentAttributes_(
            //     NSRange::new(0, attributed_string.length()),
            //     nil,
            // );
            // if rtf_data != nil {
            //     pasteboard.setData_forType(rtf_data, NSPasteboardTypeRTF);
            // }

            // let plain_text = attributed_string.string();
            // pasteboard.setString_forType(plain_text, NSPasteboardTypeString);
        }
    }
}
