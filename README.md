<!-- markdownlint-disable MD033 MD041 -->
<div align="center">

# HapticsManager

![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dswift-versions)

![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dplatforms)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

`HapticsManager` is a Swift package that provides a modular and easy-to-use interface for implementing haptic feedback in iOS applications. It integrates seamlessly with both UIKit and SwiftUI, enabling you to enhance user experience through customisable tactile feedback.

## Features

- **Custom Haptics:** Easily define and trigger haptic feedback.
- **SwiftUI Extensions:** Add haptic feedback to SwiftUI views in a declarative way.
- **User Preferences:** Enable or disable haptic feedback based on user settings through simple configuration.
- **Custom Haptic Patterns:** Extend and create your own complex haptic patterns.

## Installation

Add `HapticsManager` to your Swift project using Swift Package Manager.

```swift
dependencies: [
  .package(url: "https://github.com/markbattistella/HapticsManager", from: "1.0.0")
]
```

## Why use this

This package works similarly to the SwiftUI `.sensoryFeedback` API but adds more flexibility by letting you configure whether haptics are enabled globally via `UserDefaults`.

With `HapticsManager`, you can easily determine if haptic feedback should be available for the user — simplifying your workflow and maintaining familiar, declarative syntax.

The main advantage is that you can control the `isHapticsEnabled` key centrally, allowing or conditionally enabling haptic feedback without rewriting logic in every trigger. `.sensoryFeedback` would require you to implement this logic each time it's used.

## Usage

There are three type of ways to use the `HapticsManager`:

- **Static Action:** 
- **Static Action with Condition:** 
- **Dynamic Action:** 

### Static Action

The static action format allows you to trigger haptic feedback consistently and simply. In the example below, haptic feedback is triggered whenever the `isSuccess` state changes.

```swift
@State private var isSuccess: Bool = false

Button("isSuccess: \(isSuccess)") {
  isSuccess.toggle()
}
.hapticFeedback(.notification(.warning), trigger: isSuccess)
```

### Static Action with Condition

You can also use a condition to control when the haptic feedback should be triggered, allowing for more focused control over when feedback occurs.

```swift
enum Phase { case inactive, active, completed }

@State private var phase: Phase = .inactive

Button("Update phase") {
  switch phase {
    case .inactive: phase = .active
    case .active: phase = .completed
    case .completed: phase = .inactive
  }
}
.hapticFeedback(.impact(.medium), trigger: phase) { oldValue, newValue in
  oldValue != .completed && newValue == .completed
}
```

### Dynamic Action

The dynamic action approach gives you full control over both the type of feedback and the conditions under which it's triggered.

```swift
enum LoadingState { case ready, success, failure }

@State private var loadingState: LoadingState = .ready

Button("Update loading state") {
  switch loadingState {
    case .ready: loadingState = .success
    case .success: loadingState = .failure
    case .failure: loadingState = .ready
  }
}
.hapticFeedback(trigger: loadingState) { oldValue, newValue in
  switch (oldValue, newValue) {
    case (.failure, .ready):
      return .notification(.warning)
    case (.ready, .success):
      return .notification(.success)
    case (.success, .failure):
      return .notification(.error)
    default:
      return nil
  }
}
```

### Configuring Haptic Settings

`HapticsManager` includes a `.hapticEffectsEnabled` `UserDefaults` key, allowing you to dynamically enable or disable haptics based on user settings.

This is helpful if you want to add a settings screen for toggling haptics, or if you need an overall logic to control haptics — for example, making it a premium feature.

#### Built-in UserDefaults Suite

The package uses an internal, publicly exposed `UserDefaults` suite for storing haptic-related settings:

```swift
@main
struct MyAwesomeApp: App {

  init() {
    UserDefaults.haptic.register([
      HapticUserDefaultsKey.hapticEffectsEnabled : true
    ])
  }

  var body: some Scene {
    WindowGroup { ... }
  }
}
```

Or manually updating it:

```swift
Button("Turn haptics off") {
  UserDefaults.haptics.set(false, for: HapticUserDefaultKeys.isHapticEnabled)
}

Button("Turn haptics on") {
  UserDefaults.haptics.set(true, for: HapticUserDefaultKeys.isHapticEnabled)
}
```

> [!IMPORTANT]  
> Although you can register `UserDefaults` to any suite (`.standard` or custom), the package will only respond to the internal `.haptic` suite to prevent unintended clashes across different parts of the application.

## Extending Haptic Feedback Types

If the built-in feedback types are not sufficient, you can create custom haptic patterns using the `.custom(CustomHaptic)` `Feedback` case.

### Creating a Custom Feedback

To add a custom haptic feedback type:

1. Define a `CustomHaptic` conforming enum:

```swift
enum MyCustomHapticPattern: CustomHaptic {
  case complexSuccess

  func play() {
    switch self {
      case .complexSuccess:
        playComplexSuccessHaptic()
    }
  }
}
```

2. Implement the `play()` function to define your custom haptic feedback:

```swift
extension MyCustomHapticPattern {

  // From HWS: https://www.hackingwithswift.com/books/ios-swiftui/adding-haptic-effects
  func playComplexSuccessHaptic() {
    var events = [CHHapticEvent]()

    for i in stride(from: 0, to: 1, by: 0.1) {
      let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
      let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
      let event = CHHapticEvent(
        eventType: .hapticTransient, 
        parameters: [intensity, sharpness], 
        relativeTime: i
      )
      events.append(event)
    }

    for i in stride(from: 0, to: 1, by: 0.1) {
      let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
      let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
      let event = CHHapticEvent(
        eventType: .hapticTransient, 
        parameters: [intensity, sharpness], 
        relativeTime: 1 + i
      )
      events.append(event)
    }

    do {
      let pattern = try CHHapticPattern(events: events, parameters: [])
      let engine = try CHHapticEngine()
      try engine.start()
      let player = try engine.makePlayer(with: pattern)
      try player.start(atTime: 0)
    } catch {
      print("Failed to play pattern: \(error.localizedDescription).")
    }
  }
}
```

3. Use the custom feedback in your app:

```swift
@State private var isSuccess: Bool = false

Button("isSuccess: \(isSuccess)") {
  isSuccess.toggle()
}
.hapticFeedback(.custom(.complexSuccess), trigger: isSuccess)
```

## Contributing

Contributions are always welcome! Feel free to submit a pull request or open an issue for any suggestions or improvements you have.

## License

`HapticsManager` is licensed under the MIT License. See the LICENCE file for more details.
