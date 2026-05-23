//
// Project: HapticsManagerExample
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import HapticsManager
import HapticsManagerPresets
import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink("Static Action") {
          StaticActionDemo()
        }

        NavigationLink("Static Action w/ Condition") {
          StaticConditionDemo()
        }

        NavigationLink("Dynamic Action") {
          DynamicActionDemo()
        }

        NavigationLink("Immediate Action (no trigger)") {
          ImmediateActionDemo()
        }

        NavigationLink("Imperative inlineHaptic()") {
          FireHapticDemo()
        }

        NavigationLink("Preset Library") {
          PresetLibraryDemo()
        }
      }
      .navigationTitle("HapticsManager Demo")
    }
  }
}

private struct StaticActionDemo: View {
  @State private var isActive = false

  var body: some View {
    Form {
      Button("Tap me to open the sheet!") {
        isActive.toggle()
      }
      .hapticFeedback(.impact(.medium), trigger: isActive)
    }
    .navigationTitle("Static Action")
    .sheet(isPresented: $isActive) {
      Text("Haptic fires whenever the sheet appears and disappears.")
        .presentationDetents([.height(200)])
    }
  }
}

private struct StaticConditionDemo: View {
  enum Phase { case idle, working, finished }

  @State private var phase: Phase = .idle

  var body: some View {
    Form {
      Button("Change Phase") {
        advance()
      }
      .hapticFeedback(.notification(.success), trigger: phase) { old, new in
        old != .finished && new == .finished
      }

      Section {
        Text("Only fires when transitioning *to* .finished")
        LabeledContent("Current phase", value: phaseLabel)
      }
    }
    .navigationTitle("Static Condition")
  }

  private var phaseLabel: String {
    switch phase {
    case .idle: return "Idle"
    case .working: return "Working"
    case .finished: return "Finished"
    }
  }

  private func advance() {
    switch phase {
    case .idle: phase = .working
    case .working: phase = .finished
    case .finished: phase = .idle
    }
  }
}

private struct DynamicActionDemo: View {
  enum Status { case ready, success, error }

  @State private var status: Status = .ready

  var body: some View {
    Form {
      Button("Cycle Status") {
        next()
      }
      .hapticFeedback(trigger: status) { old, new in
        switch (old, new) {
        case (.ready, .success):
          return .notification(.success)
        case (.success, .error):
          return .notification(.error)
        default:
          return nil
        }
      }

      Section {
        Text("Dynamic haptic based on old/new transition.")
        LabeledContent("Current phase", value: statusLabel)

      }
    }
    .navigationTitle("Dynamic Action")
  }

  private var statusLabel: String {
    switch status {
    case .ready: return "Ready"
    case .success: return "Success"
    case .error: return "Error"
    }
  }

  private func next() {
    switch status {
    case .ready: status = .success
    case .success: status = .error
    case .error: status = .ready
    }
  }
}

struct ImmediateActionDemo: View {
  var body: some View {
    Form {
      Button("Tap Me") {
        inlineHaptic(.notification(.success))
      }

      Text("Haptic fires from the button action.")
    }
    .navigationTitle("Immediate Action")
  }
}

private struct FireHapticDemo: View {
  var body: some View {
    Form {
      Section {
        Button("Call inlineHaptic()") {
          inlineHaptic(.impact(.heavy))
        }
        Text("This is called within the button action.")
      }

      Section {
        Button("Custom Haptic") {
          inlineHaptic(.custom(DemoCustomHaptic.complex))
        }
        Text("Called within the button, using a custom haptic pattern")
      }
    }
    .navigationTitle("inlineHaptic()")
  }
}

private struct PresetLibraryDemo: View {
  var body: some View {
    List(HapticPreset.allCases, id: \.self) { preset in
      Button(preset.displayName) {
        inlineHaptic(.custom(preset))
      }
    }
    .navigationTitle("Preset Library")
  }
}

private enum DemoCustomHaptic: CustomHaptic {
  case complex

  @MainActor
  func play() {
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
      playPattern(pattern)
    } catch {
      return
    }
  }
}

extension HapticPreset {
  fileprivate var displayName: String {
    rawValue
      .replacingOccurrences(
        of: "([a-z0-9])([A-Z])",
        with: "$1 $2",
        options: .regularExpression
      )
      .localizedCapitalized
  }
}
