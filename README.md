<div align="center">

# HapticsManager

![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dswift-versions)

![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dplatforms)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

`HapticsManager` is a Swift package designed to manage haptic feedback within your iOS applications. It offers a centralised approach to handling both notification and impact-style haptic feedback, based on device capabilities and user preferences stored in `UserDefaults`. The package provides simple global functions and SwiftUI view modifiers for integrating haptics with minimal effort.

## Features

- **Global Access Functions:** Provides global functions for triggering haptic feedback, avoiding direct access to the singleton instance.
- **SwiftUI View Modifiers:** Easily add haptic feedback to your SwiftUI views with built-in modifiers.
- **UserDefaults Integration:** Automatically configures haptic settings like enabling/disabling feedback and logging based on user preferences.
- **Device Capability Check:** Automatically detects and respects the device's haptic feedback capabilities.
- **Thread-Safe Access:** Ensures thread-safe management of haptic settings using Grand Central Dispatch (GCD).
- **Built-In Configurable Logging:** Optional and configurable logging for debugging haptic feedback actions, with adjustable thresholds for log rate-limiting.
- **Customizable Logging Modes:** Supports `smart` and `complete` logging modes with configurable thresholds for skip logs and log intervals.

## Installation

Add `HapticsManager` to your Swift project using Swift Package Manager.

```swift
dependencies: [
  .package(url: "https://github.com/markbattistella/HapticsManager", from: "1.0.0")
]
```

## Usage

### Triggering Haptic Feedback with Global Functions

`HapticsManager` simplifies the use of haptic feedback by providing global functions. To trigger notification or impact feedback, use:

```swift
import HapticsManager

// Trigger notification feedback (e.g., success, warning, error)
hapticAction(.success)

// Trigger impact feedback (e.g., light, medium, heavy)
hapticAction(.medium)
```

### Adding Haptic Feedback to SwiftUI Views

Easily add haptic feedback to your SwiftUI views using the provided modifiers:

```swift
import SwiftUI
import HapticsManager

struct ContentView: View {
  var body: some View {
    VStack {
      Button("Tap for Success Haptic") {
        // Haptic feedback is automatically triggered by the modifier
      }
      .haptic(.success)

      Button("Tap for Medium Impact Haptic") {
        // Haptic feedback is automatically triggered by the modifier
      }
      .haptic(.medium) // Adds impact feedback
    }
  }
}
```

### Configuring Haptic Settings

`HapticsManager` uses `UserDefaults` for storing haptic settings. The package provides default keys through the `HapticUserDefaultKeys` enum, which you can use to set preferences:

```swift
import HapticsManager

// Enable haptic effects
UserDefaults.standard.set(true, forKey: HapticUserDefaultKeys.hapticEffectsEnabled.rawValue)

// Enable logging
UserDefaults.standard.set(true, forKey: HapticUserDefaultKeys.hapticLoggingEnabled.rawValue)
```

### Customising Logging

`HapticsManager` now supports configurable logging modes (`smart` and `complete`) with customisable thresholds for skip logs and logging intervals. Logging can be enabled or disabled based on user preferences:

```swift
// Toggle logging preference
UserDefaults.standard.set(true, forKey: HapticUserDefaultKeys.hapticLoggingEnabled.rawValue)

// Use different logging modes with custom thresholds
let loggingMode = LoggingMode.smart(skipLogThreshold: 20, logThreshold: 60) // Customize thresholds
HapticsManager.shared.logSettings(mode: loggingMode)
```

## Extending Haptic Feedback Types

To add more haptic feedback types, extend the `UINotificationFeedbackGenerator.FeedbackType` or `UIImpactFeedbackGenerator.FeedbackStyle` if custom handling is required.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue if you have suggestions or improvements.

## License

`HapticsManager` is licensed under the MIT License. See the LICENSE file for more details.
