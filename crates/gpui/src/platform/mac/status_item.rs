use std::sync::Arc;

use crate::platform::FontSystem;

extern "C" {
    fn zed_status_item_create() -> u64;
    fn zed_status_item_set_title(id: u64, title: *const ::std::os::raw::c_char);
    fn zed_status_item_remove(id: u64);
    fn zed_status_item_set_image(
        id: u64,
        bytes: *const u8,
        len: usize,
        uti: *const ::std::os::raw::c_char,
        is_template: bool,
    );
    fn zed_status_item_set_menu(id: u64, json: *const ::std::os::raw::c_char);
}

pub struct StatusItem {
    id: u64,
}

impl StatusItem {
    pub fn add(_fonts: Arc<dyn FontSystem>) -> Self {
        let id = unsafe { zed_status_item_create() };
        // Give it a default title for now; callers can change it
        if let Ok(c) = std::ffi::CString::new("Zed") {
            unsafe { zed_status_item_set_title(id, c.as_ptr()) };
        }
        Self { id }
    }

    pub fn set_title(&self, title: &str) {
        if let Ok(c) = std::ffi::CString::new(title) {
            unsafe { zed_status_item_set_title(self.id, c.as_ptr()) };
        }
    }

    pub fn set_click_handler(&self, handler: Box<dyn FnMut() + Send>) {
        register_status_item_handler(self.id, handler);
    }

    pub fn set_image(&self, format: crate::ImageFormat, bytes: &[u8], template: bool) {
        let uti = match format {
            crate::ImageFormat::Png => "public.png",
            crate::ImageFormat::Jpeg => "public.jpeg",
            crate::ImageFormat::Tiff => "public.tiff",
            crate::ImageFormat::Webp => "org.webmproject.webp",
            crate::ImageFormat::Gif => "com.compuserve.gif",
            crate::ImageFormat::Bmp => "com.microsoft.bmp",
            crate::ImageFormat::Svg => "public.svg-image",
        };
        if let Ok(cuti) = std::ffi::CString::new(uti) {
            unsafe {
                zed_status_item_set_image(
                    self.id,
                    bytes.as_ptr(),
                    bytes.len(),
                    cuti.as_ptr(),
                    template,
                )
            };
        }
    }
}

impl Drop for StatusItem {
    fn drop(&mut self) {
        unregister_status_item_handler(self.id);
        unsafe { zed_status_item_remove(self.id) };
    }
}

// Click handler registry
use std::collections::HashMap;
use std::sync::{Mutex, OnceLock};

static STATUS_ITEM_HANDLERS: OnceLock<Mutex<HashMap<u64, Box<dyn FnMut() + Send>>>> = OnceLock::new();

fn register_status_item_handler(id: u64, handler: Box<dyn FnMut() + Send>) {
    STATUS_ITEM_HANDLERS
        .get_or_init(|| Mutex::new(HashMap::new()))
        .lock()
        .unwrap()
        .insert(id, handler);
}

fn unregister_status_item_handler(id: u64) {
    STATUS_ITEM_HANDLERS
        .get_or_init(|| Mutex::new(HashMap::new()))
        .lock()
        .unwrap()
        .remove(&id);
}

#[no_mangle]
pub extern "C" fn gpui_status_item_clicked(id: u64) {
    if let Some(mut handler) = STATUS_ITEM_HANDLERS
        .get_or_init(|| Mutex::new(HashMap::new()))
        .lock()
        .unwrap()
        .get_mut(&id)
    {
        handler();
    }
}

// Status item menu support
use crate::menu::{Menu as AppMenu, MenuItem as AppMenuItem};

static STATUS_ITEM_MENU_ACTIONS: OnceLock<Mutex<HashMap<u64, Vec<Box<dyn crate::Action + Send>>>>> = OnceLock::new();

impl StatusItem {
    pub fn set_menu(&self, menu: &AppMenu) {
        // Build JSON and tag -> action map per status item id
        #[derive(serde::Serialize)]
        #[serde(tag = "kind", rename_all = "lowercase")]
        enum JsItem<'a> { Action { title: &'a str, tag: u64 }, Separator, Submenu { title: &'a str, items: Vec<JsItem<'a>> } }
        #[derive(serde::Serialize)]
        struct JsSpec<'a> { items: Vec<JsItem<'a>> }

        let mut actions = Vec::<Box<dyn crate::Action + Send>>::new();
        fn encode_items<'a>(src: &'a [AppMenuItem], actions: &mut Vec<Box<dyn crate::Action + Send>>, out: &mut Vec<JsItem<'a>>) {
            for item in src {
                match item {
                    AppMenuItem::Separator => out.push(JsItem::Separator),
                    AppMenuItem::Action { name, action, .. } => {
                        let tag = actions.len() as u64;
                        actions.push(action.boxed_clone());
                        out.push(JsItem::Action { title: name, tag });
                    }
                    AppMenuItem::Submenu(AppMenu { name, items }) => {
                        let mut sub = Vec::new();
                        encode_items(items, actions, &mut sub);
                        out.push(JsItem::Submenu { title: name, items: sub });
                    }
                    AppMenuItem::SystemMenu(_) => {
                        // Not supported in status item menu context currently
                    }
                }
            }
        }

        let mut js_items = Vec::new();
        encode_items(&menu.items, &mut actions, &mut js_items);
        let spec = JsSpec { items: js_items };
        let json = serde_json::to_string(&spec).unwrap_or_else(|_| "{\"items\":[]}".into());
        STATUS_ITEM_MENU_ACTIONS
            .get_or_init(|| Mutex::new(HashMap::new()))
            .lock()
            .unwrap()
            .insert(self.id, actions);
        if let Ok(cjson) = std::ffi::CString::new(json) {
            unsafe { zed_status_item_set_menu(self.id, cjson.as_ptr()) };
        }
    }
}

#[no_mangle]
pub extern "C" fn gpui_status_item_menu_action(id: u64, tag: u64) {
    if let Some(vec) = STATUS_ITEM_MENU_ACTIONS
        .get_or_init(|| Mutex::new(HashMap::new()))
        .lock()
        .unwrap()
        .get_mut(&id)
    {
        if let Some(action) = vec.get(tag as usize) {
            super::platform::dispatch_menu_action(action.as_ref());
        }
    }
}
