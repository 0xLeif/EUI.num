// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EUI.num",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EUI.num",
            targets: ["EUI.num"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        
        // Primary Packages
        .package(name: "Observation", url: "https://github.com/0xLeif/Observation", from: "0.0.1"),
        .package(name: "ScreenDataUI", url: "https://github.com/ServerDriven/ScreenDataUI-ios", from: "0.4.0"),
        
        // Helper Packages
        .package(name: "xColor", url: "https://github.com/0xLeif/xColor", from: "0.1.0"),
        .package(name: "Fake", url: "https://github.com/0xLeif/Fake", from: "0.1.1"),
        .package(name: "Combino", url: "https://github.com/0xLeif/Combino", from: "0.2.0"),
        .package(name: "SURL", url: "https://github.com/0xLeif/SURL", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "EUI.num",
            dependencies: [
                // Primary Dependencies
                "Observation",
                "ScreenDataUI",
                
                // Helper Dependencies
                "xColor",
                "Fake",
                "Combino",
                "SURL"
            ]),
        .testTarget(
            name: "EUI.numTests",
            dependencies: [
                "EUI.num",
                "ScreenDataUI"
            ]),
    ]
)
