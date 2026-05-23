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
    ),
    .library(
      name: "HapticsManagerPresets",
      targets: ["HapticsManagerPresets"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/markbattistella/DefaultsKit", from: "26.0.0"),
    .package(url: "https://github.com/markbattistella/TriggerKit", from: "26.0.0"),
  ],
  targets: [
    .target(
      name: "HapticsManager",
      dependencies: ["DefaultsKit", "TriggerKit"],
      swiftSettings: [.swiftLanguageMode(.v6)]
    ),
    .target(
      name: "HapticsManagerPresets",
      dependencies: ["HapticsManager"],
      swiftSettings: [.swiftLanguageMode(.v6)]
    ),
  ],
  swiftLanguageModes: [.v6]
)
