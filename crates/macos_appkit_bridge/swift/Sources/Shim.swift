import AppKit
import Foundation
@_silgen_name("gpui_menu_action")
func gpui_menu_action(_ tag: UInt64)

fileprivate var menuActionHandlerRegistered = false

@_cdecl("zed_register_menu_handler")
public func zed_register_menu_handler() {
    // No-op: we call back to Rust via the global exported function.
    menuActionHandlerRegistered = true
}

@_cdecl("zed_set_main_menu_json")
public func zed_set_main_menu_json(_ json: UnsafePointer<CChar>) {
    let str = String(cString: json)
    struct Item: Codable {
        let kind: String
        let title: String?
        let tag: UInt64?
        let key_equivalent: String?
        let modifiers: [String]?
        let system_type: String?
        let items: [Item]?
    }
    struct Menu: Codable { let title: String; let items: [Item] }
    struct Spec: Codable { let menus: [Menu] }
    guard let data = str.data(using: .utf8), let spec = try? JSONDecoder().decode(Spec.self, from: data) else { return }

    func buildMenu(_ items: [Item]) -> NSMenu {
        let menu = NSMenu()
        for it in items {
            switch it.kind {
            case "separator":
                menu.addItem(NSMenuItem.separator())
            case "action":
                let key = it.key_equivalent ?? ""
                let mi = NSMenuItem(title: it.title ?? "", action: #selector(MenuTarget.onMenuAction(_:)), keyEquivalent: key)
                mi.target = MenuTarget.shared
                if let mods = it.modifiers { mi.keyEquivalentModifierMask = modifiers(from: mods) }
                if let tag = it.tag { mi.tag = Int(tag) }
                menu.addItem(mi)
            case "submenu":
                let mi = NSMenuItem(title: it.title ?? "", action: nil, keyEquivalent: "")
                let sub = buildMenu(it.items ?? [])
                mi.submenu = sub
                menu.addItem(mi)
            case "system":
                let mi = NSMenuItem(title: it.title ?? "", action: nil, keyEquivalent: "")
                let sub = buildMenu(it.items ?? [])
                mi.submenu = sub
                // Wire special menus
                if let st = it.system_type {
                    if st == "services" { NSApp.servicesMenu = sub }
                    if st == "windows" { NSApp.windowsMenu = sub }
                }
                menu.addItem(mi)
            default:
                continue
            }
        }
        return menu
    }

    func modifiers(from names: [String]) -> NSEvent.ModifierFlags {
        var flags: NSEvent.ModifierFlags = []
        for name in names {
            switch name.lowercased() {
            case "command": flags.insert(.command)
            case "control": flags.insert(.control)
            case "option": flags.insert(.option)
            case "shift": flags.insert(.shift)
            default: break
            }
        }
        return flags
    }

    let mainMenu = NSMenu()
    for m in spec.menus {
        let mi = NSMenuItem(title: m.title, action: nil, keyEquivalent: "")
        let sub = buildMenu(m.items)
        mi.submenu = sub
        if m.title == "Window" { NSApp.windowsMenu = sub }
        mainMenu.addItem(mi)
    }
    DispatchQueue.main.async {
        mainMenu.delegate = MenuTarget.shared
        NSApp.mainMenu = mainMenu
    }
}

@objc class MenuTarget: NSObject {
    static let shared = MenuTarget()
    @objc func onMenuAction(_ sender: NSMenuItem) {
        guard menuActionHandlerRegistered else { return }
        gpui_menu_action(UInt64(sender.tag))
    }
}

@objc extension MenuTarget: NSMenuItemValidation {
    func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        return gpui_validate_menu_action(UInt64(menuItem.tag))
    }
}

@objc extension MenuTarget: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        gpui_menu_will_open()
    }
}

@_silgen_name("gpui_validate_menu_action")
func gpui_validate_menu_action(_ tag: UInt64) -> Bool

@_silgen_name("gpui_menu_will_open")
func gpui_menu_will_open()

// MARK: - Panels (Open/Save) C ABI

@_silgen_name("gpui_open_panel_result")
func gpui_open_panel_result(_ requestId: UInt64, _ json: UnsafePointer<CChar>)

@_silgen_name("gpui_save_panel_result")
func gpui_save_panel_result(_ requestId: UInt64, _ json: UnsafePointer<CChar>)

@_cdecl("zed_open_panel")
public func zed_open_panel(_ requestId: UInt64, _ json: UnsafePointer<CChar>) {
    struct OpenOpts: Codable { let directories: Bool; let files: Bool; let multiple: Bool; let prompt: String? }
    let str = String(cString: json)
    guard let data = str.data(using: .utf8), let opts = try? JSONDecoder().decode(OpenOpts.self, from: data) else { return }
    let panel = NSOpenPanel()
    panel.canChooseDirectories = opts.directories
    panel.canChooseFiles = opts.files
    panel.allowsMultipleSelection = opts.multiple
    panel.canCreateDirectories = true
    panel.resolvesAliases = false
    if let p = opts.prompt { panel.prompt = p }
    DispatchQueue.main.async {
        panel.begin { resp in
            var result: [String]? = nil
            if resp == .OK {
                result = panel.urls.filter { $0.isFileURL }.map { $0.path }
            }
            let payload: [String: Any?] = ["paths": result]
            if let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []), let jsonStr = String(data: jsonData, encoding: .utf8) {
                jsonStr.withCString { gpui_open_panel_result(requestId, $0) }
            } else {
                "{\"paths\":null}".withCString { gpui_open_panel_result(requestId, $0) }
            }
        }
    }
}

@_cdecl("zed_save_panel")
public func zed_save_panel(_ requestId: UInt64, _ json: UnsafePointer<CChar>) {
    struct SaveOpts: Codable { let directory: String; let suggested_name: String? }
    let str = String(cString: json)
    guard let data = str.data(using: .utf8), let opts = try? JSONDecoder().decode(SaveOpts.self, from: data) else { return }
    let panel = NSSavePanel()
    panel.directoryURL = URL(fileURLWithPath: opts.directory, isDirectory: true)
    if let name = opts.suggested_name { panel.nameFieldStringValue = name }
    DispatchQueue.main.async {
        panel.begin { resp in
            var path: String? = nil
            if resp == .OK, let url = panel.url, url.isFileURL { path = url.path }
            let payload: [String: Any?] = ["path": path]
            if let jsonData = try? JSONSerialization.data(withJSONObject: payload, options: []), let jsonStr = String(data: jsonData, encoding: .utf8) {
                jsonStr.withCString { gpui_save_panel_result(requestId, $0) }
            } else {
                "{\"path\":null}".withCString { gpui_save_panel_result(requestId, $0) }
            }
        }
    }
}

// MARK: - Pasteboard helpers (text)

@_cdecl("zed_pasteboard_write_text")
public func zed_pasteboard_write_text(_ text: UnsafePointer<CChar>) {
    let str = String(cString: text)
    NSPasteboard.general.clearContents()
    NSPasteboard.general.setString(str, forType: NSPasteboard.PasteboardType.string)
}

@_cdecl("zed_pasteboard_read_text")
public func zed_pasteboard_read_text() -> UnsafeMutablePointer<CChar>? {
    if let s = NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) {
        return strdup(s)
    }
    return nil
}

// MARK: - Pasteboard helpers (images via UTI)

@_cdecl("zed_pasteboard_write_image")
public func zed_pasteboard_write_image(_ bytes: UnsafePointer<UInt8>, _ len: Int, _ uti: UnsafePointer<CChar>) {
    let data = Data(bytes: bytes, count: len)
    let type = NSPasteboard.PasteboardType(String(cString: uti))
    let pb = NSPasteboard.general
    pb.clearContents()
    pb.setData(data, forType: type)
}

// MARK: - Status Item (NSStatusItem)

@_silgen_name("gpui_status_item_clicked")
func gpui_status_item_clicked(_ id: UInt64)
@_silgen_name("gpui_status_item_menu_action")
func gpui_status_item_menu_action(_ id: UInt64, _ tag: UInt64)

fileprivate class StatusItemTarget: NSObject {
    let id: UInt64
    init(id: UInt64) { self.id = id }
    @objc func onClick(_ sender: Any?) { gpui_status_item_clicked(id) }
    @objc func onMenuAction(_ sender: NSMenuItem) { gpui_status_item_menu_action(id, UInt64(sender.tag)) }
}

fileprivate var statusItems: [UInt64: NSStatusItem] = [:]
fileprivate var statusTargets: [UInt64: StatusItemTarget] = [:]
fileprivate var statusCounter: UInt64 = 1

@_cdecl("zed_status_item_create")
public func zed_status_item_create() -> UInt64 {
    let id = statusCounter; statusCounter += 1
    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let target = StatusItemTarget(id: id)
    item.button?.target = target
    item.button?.action = #selector(StatusItemTarget.onClick(_:))
    statusTargets[id] = target
    statusItems[id] = item
    return id
}

@_cdecl("zed_status_item_set_title")
public func zed_status_item_set_title(_ id: UInt64, _ title: UnsafePointer<CChar>) {
    if let item = statusItems[id] {
        item.button?.title = String(cString: title)
    }
}

@_cdecl("zed_status_item_set_image")
public func zed_status_item_set_image(_ id: UInt64, _ bytes: UnsafePointer<UInt8>, _ len: Int, _ uti: UnsafePointer<CChar>, _ isTemplate: Bool) {
    guard let item = statusItems[id] else { return }
    let data = Data(bytes: bytes, count: len)
    if let image = NSImage(data: data) {
        image.isTemplate = isTemplate
        item.button?.image = image
    }
}

@_cdecl("zed_status_item_remove")
public func zed_status_item_remove(_ id: UInt64) {
    if let item = statusItems[id] { NSStatusBar.system.removeStatusItem(item) }
    statusItems.removeValue(forKey: id)
    statusTargets.removeValue(forKey: id)
}

@_cdecl("zed_status_item_set_menu")
public func zed_status_item_set_menu(_ id: UInt64, _ json: UnsafePointer<CChar>) {
    guard let item = statusItems[id] else { return }
    let str = String(cString: json)
    struct Item: Codable { let kind: String; let title: String?; let tag: UInt64?; let items: [Item]? }
    struct Spec: Codable { let items: [Item] }
    guard let data = str.data(using: .utf8), let spec = try? JSONDecoder().decode(Spec.self, from: data) else { return }
    func buildMenu(_ items: [Item], _ target: StatusItemTarget) -> NSMenu {
        let menu = NSMenu()
        for it in items {
            switch it.kind {
            case "separator":
                menu.addItem(NSMenuItem.separator())
            case "action":
                let mi = NSMenuItem(title: it.title ?? "", action: #selector(StatusItemTarget.onMenuAction(_:)), keyEquivalent: "")
                mi.target = target
                if let tag = it.tag { mi.tag = Int(tag) }
                menu.addItem(mi)
            case "submenu":
                let mi = NSMenuItem(title: it.title ?? "", action: nil, keyEquivalent: "")
                mi.submenu = buildMenu(it.items ?? [], target)
                menu.addItem(mi)
            default:
                continue
            }
        }
        return menu
    }
    let target = statusTargets[id] ?? StatusItemTarget(id: id)
    statusTargets[id] = target
    let menu = buildMenu(spec.items, target)
    item.menu = menu
}

@_cdecl("zed_pasteboard_read_image")
public func zed_pasteboard_read_image(_ uti: UnsafePointer<CChar>, _ out_len: UnsafeMutablePointer<Int>) -> UnsafeMutablePointer<UInt8>? {
    let type = NSPasteboard.PasteboardType(String(cString: uti))
    let pb = NSPasteboard.general
    if let data = pb.data(forType: type) {
        out_len.pointee = data.count
        let ptr = malloc(data.count)!.assumingMemoryBound(to: UInt8.self)
        data.copyBytes(to: ptr, count: data.count)
        return ptr
    } else {
        out_len.pointee = 0
        return nil
    }
}
