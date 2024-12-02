// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "HapticsManager",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "HapticsManager",
            targets: ["HapticsManager"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/markbattistella/DefaultsKit", from: "2.0.0"),
        .package(url: "https://github.com/markbattistella/TriggerKit", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "HapticsManager",
            dependencies: ["DefaultsKit", "TriggerKit"],
            exclude: []
        )
    ]
)
