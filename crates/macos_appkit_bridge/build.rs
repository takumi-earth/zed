#[cfg(target_os = "macos")]
fn main() {
    // Build Swift package and link static library
    let _out_dir = std::env::var("OUT_DIR").unwrap();
    let package_dir = std::env::current_dir().unwrap();

    let swift_dir = package_dir.join("swift");
    std::fs::create_dir_all(&swift_dir).ok();

    // No codegen needed for C ABI shim

    // Build the Swift package containing our shim and the generated bridge.
    let status = std::process::Command::new("swift")
        .current_dir(&swift_dir)
        .args(["build", "-c", "release"])
        .status()
        .expect("Failed to spawn swift build");
    if !status.success() {
        panic!("swift build failed: {:?}", status);
    }

    // Link the produced static library; default SwiftPM output directory
    let lib_dir = std::path::Path::new(&swift_dir)
        .join(".build")
        .join("release");
    println!("cargo:rustc-link-search=native={}", lib_dir.display());
    println!("cargo:rustc-link-lib=static=SwiftPackage");
    println!("cargo:rustc-link-lib=framework=AppKit");
}

#[cfg(not(target_os = "macos"))]
fn main() {}
