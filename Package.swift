// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "HapticsManager",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
    ],
    products: [
        .library(
            name: "HapticsManager",
            targets: ["HapticsManager"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/markbattistella/DefaultsKit", from: "2.0.0"),
        .package(url: "https://github.com/markbattistella/SimpleLogger", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "HapticsManager",
            dependencies: ["DefaultsKit", "SimpleLogger"],
            exclude: [],
            swiftSettings: [.enableExperimentalFeature("StrictConcurrency")]
        )
    ]
)
