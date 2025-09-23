Title: Build fixes + macOS objc2 prep: gpui menus, tungstenite alignment, clippy cleanups

Overview

- Target: Build the `zed` workspace locally without errors.
- Primary blocker: `jupyter-websocket-client` failed to compile due to unresolved imports from `async-tungstenite` and a follow‑on type mismatch caused by two different `async-tungstenite` versions in the dependency graph.
- Approach: Enable the correct feature on `async-tungstenite` v0.31.0 required by `jupyter-websocket-client`, and isolate type identity by importing that version via an alias in the `repl` crate where the websocket types are used. On macOS, standardize menus on raw Objective‑C, adopt icrate typed constants, and prepare for an objc2 migration.

Changes Since Last Update

- Menus (platform.rs):
  - Replaced Cocoa shims with raw Objective‑C for `NSMenu`/`NSMenuItem` (create via `alloc/new/init` + `autorelease`).
  - Added `add_menu_item(parent_menu, ...)` that creates separator/action/submenu/system items and immediately adds them to the parent (correct retention and simpler lifetimes).
  - Rewired window/services menus with `setWindowsMenu:` and `setServicesMenu:` (`msg_send!`).
  - Removed the legacy `create_menu_item` helper; no callers remain.

- objc2 dependency (Cargo):
  - Made `objc2` non‑optional on macOS and removed it from the `macos-blade` feature set.
  - Enabled icrate features for NSMenu/NSMenuItem/NSStatusBar/NSScroller to support typed usage.

- Other mac modules:
  - status_item.rs: using icrate `NSSquareStatusItemLength` and `NSViewLayerContentsRedrawDuringViewResize`.
  - window_appearance.rs: switched to icrate `NSAppearanceName*` and localized unsafe.
  - events.rs: localized unsafe blocks around typed getters; removed unnecessary casts.

- collab crate (clippy blockers):
  - Removed conflicting manual `Nullable` impl in ids.rs; disambiguated `to_string` calls in queries and tests to avoid trait collisions with `sea_orm::Iden`.

Root Cause Analysis (build failures)

1) Feature gating in `async-tungstenite` 0.31.0

- `jupyter-websocket-client` imports `async_tungstenite::tokio`, which is behind the `tokio-runtime` feature in `async-tungstenite` v0.31.0.
- That feature wasn’t enabled in our graph, causing unresolved imports during compilation.

2) Multiple `async-tungstenite` versions in the workspace

- The workspace depends on `async-tungstenite` v0.29.1 (via `workspace.dependencies`).
- `jupyter-websocket-client` depends on `async-tungstenite` v0.31.0.
- When `repl` used `connect_async` and also consumed types produced by `jupyter-websocket-client`, we ended up with two different `WebSocketStream` types. Even if generics look the same, different crate versions yield distinct types, causing a mismatch.

Changes Implemented (build fixes)

1) Alias `async-tungstenite` v0.31.0 in `repl` with `tokio-runtime` enabled

- crates/repl/Cargo.toml:
  - `async_tungstenite_031 = { package = "async-tungstenite", version = "0.31.0", default-features = false, features = ["tokio-runtime"] }`

2) Import the aliased crate in `repl`

- crates/repl/src/kernels/remote_kernels.rs:
  - `use async_tungstenite_031::tokio::connect_async;`
  - `use async_tungstenite_031::tungstenite::{client::IntoClientRequest, http::HeaderValue};`

Why this works

- Ensures `async_tungstenite::tokio` is compiled in v0.31.0 by enabling `tokio-runtime`.
- Aligns all websocket types used in `repl` with those produced by `jupyter-websocket-client` (0.31.0), removing cross‑version type mismatches.

Validation

- `cargo check -p repl` passes.
- `cargo check -p zed` passes.
- `cargo clippy -p gpui --all-targets` runs clean (shader cache on macOS may require elevated permissions).
- `cargo clippy --workspace --all-targets` runs clean after `collab` fixes.

macOS objc2 Migration Prep

- Standardize raw Objective‑C messaging via `msg_send` in menus while adopting icrate typed constants where they bring clarity and safety.
- Make `objc2` unconditional on macOS to avoid feature mismatch; defer full typed migration to phased follow‑ups.

Planned Phases (high level)

- Phase 1 — Typed Menus: use `objc2::msg_send_id!`, `Retained<T>`, typed setters; convert strings to icrate `NSString`.
- Phase 2 — Typed NSString/Selectors: introduce a helper and replace remaining Cocoa `NSString` usage where practical.
- Phase 3 — Beyond Menus: migrate services hooks, panels, pasteboard, and common NSApplication calls to objc2 typed APIs.
- Phase 4 — window.rs Sweep: re‑scan for typed replacements, confirm parity.

Risks and Mitigations

- Macro family mixing: avoid mixing `objc` and `objc2` macros within the same section; convert sections atomically and keep raw `id` interop localized.
- Retention/lifetimes: add items to parents immediately, prefer typed ownership where available.
- Rollback: current raw Objective‑C path is stable and can serve as fallback if needed.

Design Notes and Trade‑offs

- Minimal blast radius for build fixes: avoided a workspace‑wide `async-tungstenite` bump; used a targeted alias to keep other crates stable.
- Type identity: ensured websocket types come from a single crate version where the integration actually happens.
- Future: consider unifying `async-tungstenite` across the workspace to 0.31.x after a dedicated validation sweep.

Follow‑ups / Backlog

- Unify `async-tungstenite` versions workspace‑wide; align `tokio-tungstenite` and `tungstenite` accordingly.
- Continue objc2 typed migration across mac modules (services, panels, pasteboard, NSApplication).
- Replace remaining numeric constants with icrate typed constants where available.
- Optional: enforce single‑version policy via `cargo-deny` (bans), add CI checks.

Files of Interest

- AGENTS.md: detailed narrative of the build fixes, macOS migration prep, validation steps, and plans.
- crates/repl/Cargo.toml: alias for `async-tungstenite` 0.31.0 with `tokio-runtime`.
- crates/repl/src/kernels/remote_kernels.rs: imports updated to aliased 0.31.0 to match `jupyter-websocket-client`.
- macOS modules in `gpui`: menus standardized on raw Objective‑C; icrate constants adopted; objc2 made unconditional.

Checklist

- [x] cargo fmt
- [x] cargo check -p gpui
- [x] cargo clippy -p gpui --all-targets
- [x] cargo clippy --workspace --all-targets
- [x] Update AGENTS.md with scope, changes, and validation

Notes

- For shader compilation on macOS during clippy, elevated permissions may be needed due to shader cache writes.
- `gh` PR text mirrors AGENTS.md for maximum reviewer context; future PRs can be shorter once objc2 migration stabilizes.
