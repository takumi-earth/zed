#[cfg(target_os = "macos")]
fn main() {
    // Build Swift package and link static library
    let _out_dir = std::env::var("OUT_DIR").unwrap();
    let package_dir = std::env::current_dir().unwrap();

    let swift_dir = package_dir.join("swift");
    std::fs::create_dir_all(&swift_dir).ok();

    // No codegen needed for C ABI shim

    // Rebuild when the Swift sources change.
    println!("cargo:rerun-if-changed=swift/Package.swift");
    println!("cargo:rerun-if-changed=swift/Sources");

    // Select target architecture so cross-compiles (e.g. x86_64 on arm64) link correctly.
    let target = std::env::var("TARGET").expect("TARGET unset");
    let arch_flag = match target.as_str() {
        "aarch64-apple-darwin" => Some("arm64"),
        "x86_64-apple-darwin" => Some("x86_64"),
        _ => None,
    };

    // Build the Swift package containing our shim and the generated bridge.
    let mut build_cmd = std::process::Command::new("swift");
    build_cmd.current_dir(&swift_dir).args(["build", "-c", "release"]);
    if let Some(arch) = arch_flag {
        build_cmd.args(["--arch", arch]);
    }
    let status = build_cmd.status().expect("Failed to spawn swift build");
    if !status.success() {
        panic!("swift build failed: {:?}", status);
    }

    // Link the produced static library; prefer arch-specific directory when present.
    let arch_lib_dir = arch_flag.map(|arch| {
        swift_dir
            .join(".build")
            .join(format!("{}-apple-macosx", arch))
            .join("release")
    });
    let generic_lib_dir = swift_dir.join(".build").join("release");
    let lib_dir = arch_lib_dir
        .as_ref()
        .filter(|path| path.exists())
        .unwrap_or(&generic_lib_dir);
    println!("cargo:rustc-link-search=native={}", lib_dir.display());
    println!("cargo:rustc-link-lib=static=SwiftPackage");
    println!("cargo:rustc-link-lib=framework=AppKit");
}

#[cfg(not(target_os = "macos"))]
fn main() {}
