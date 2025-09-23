// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftPackage",
    platforms: [ .macOS(.v12) ],
    products: [
        .library(name: "SwiftPackage", type: .static, targets: ["SwiftPackage"]) // static lib
    ],
    targets: [
        .target(name: "SwiftPackage", path: "Sources")
    ]
)
