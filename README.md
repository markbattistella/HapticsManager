<!-- markdownlint-disable MD024 MD033 MD041 -->
<div align="center">

# HapticsManager

![Swift Versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dswift-versions)

![Platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmarkbattistella%2FHapticsManager%2Fbadge%3Ftype%3Dplatforms)

![Licence](https://img.shields.io/badge/Licence-MIT-white?labelColor=blue&style=flat)

</div>

`HapticsManager` is a Swift package that provides a modular and easy-to-use interface for implementing haptic feedback in your applications. It integrates seamlessly with SwiftUI, enabling you to enhance user experience through customisable tactile feedback.

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

- **Static Action:** This is the simplest method, used when you want to trigger haptic feedback for a particular state change. It's consistent and straightforward — ideal when the haptic feedback needs to occur every time a specific condition (like a state variable changing) is met.
- **Static Action with Condition:** This approach adds more control compared to the standard static action. Here, you specify a set of conditions to determine when the haptic feedback should be triggered. This allows you to handle more nuanced scenarios — such as only playing feedback when transitioning from one specific state to another, while ignoring others.
- **Dynamic Action:** The most flexible of the three, dynamic actions let you determine the type of haptic feedback based on the old and new values during a state change. This means you can implement complex feedback behaviours that respond differently based on how the state transitions, allowing for a more dynamic and tailored user experience.

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

#### Old and New Values

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

#### New Value Only

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
.hapticFeedback(.impact(.medium), trigger: phase) { newValue in
  newValue == .completed
}
```

#### No Parameters

```swift
@State private var phase: Bool = false

Button("Toggle Phase") {
  phase.toggle()
}
.hapticFeedback(.impact(.medium), trigger: phase) {
  // Haptic feedback triggered
}
```

### Dynamic Action

The dynamic action approach gives you full control over both the type of feedback and the conditions under which it's triggered.

#### Old and New Values

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

#### New Values Only

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
.hapticFeedback(trigger: loadingState) { newValue in
  switch newValue {
    case .success: return .notification(.success)
    case .failure: return .notification(.error)
    default: return nil
  }
}
```

#### No Parameters

```swift
@State private var isLoading: Bool = false

Button("Toggle Loading") {
  isLoading.toggle()
}
.hapticFeedback(trigger: isLoading) {
  return .impact(.heavy)
}
```

### Immediate Haptic Feedback

In addition to the state-driven haptic APIs, `HapticsManager` offers Immediate Action APIs designed to trigger haptic feedback directly from user interaction.

These are ideal when you want haptics to fire each time the user taps a view, or when you want full control inside a Button action.

There are two forms:

1. Declarative Tap-Driven Haptic Feedback: `.hapticFeedback(_:)`
2. Imperative Haptic Trigger: `.inlineHaptic(_:)`

Each serves a different role.

#### Declarative Immediate Action (tap-triggered)

Attach haptic feedback to any tappable view.

The haptic is triggered when the user taps the view, not when state changes or when the view re-renders.

```swift
Text("Tap Me")
    .padding()
    .hapticFeedback(.impact(.medium))
```

This is useful for:

- Text, Image, Shape
- Custom tappable areas
- Views where you want to provide tactile response on tap

> [!NOTE]
> In certain contexts—such as Form, List, toolbar items, or heavily styled buttons—SwiftUI’s internal gesture system may interfere with tap delivery. In those cases, use `inlineHaptic(_:)` instead.

#### Imperative Immediate Action (`inlineHaptic`)

Use this method to trigger a haptic directly inside your action handler.

```swift
Button("Submit") {
    inlineHaptic(.notification(.success))
    submitForm()
}
```

This approach is:

- The most reliable for Buttons
- Guaranteed to fire exactly when called
- Not dependent on SwiftUI gesture routing
- Safe inside async tasks, callbacks, gesture recognisers, etc.

This mirrors UIKit’s pattern:

```swift
UIImpactFeedbackGenerator(style: .medium).impactOccurred()
```

##### Recommended usage

Use `inlineHaptic(_:)` instead of `.hapticFeedback(_:)` when:

- Inside a Button
- Inside Form
- Inside List
- Inside toolbar actions
- When the action may be triggered programmatically
- When you want exactly one haptic per action execution

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
