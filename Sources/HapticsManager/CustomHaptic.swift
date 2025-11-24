//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
@_exported import CoreHaptics

/// A type that defines a custom haptic feedback behaviour.
///
/// Conform to this protocol to provide custom haptic effects that cannot be produced using the
/// built-in UIKit generators. Implement the `play()` method to perform the desired haptic
/// pattern.
///
/// Use `playPattern(_:)` to play a `CHHapticPattern` with the package’s managed haptic engine,
/// or access `hapticEngine` directly to coordinate more advanced or scheduled playback.
public protocol CustomHaptic {

    /// Performs the custom haptic feedback.
    ///
    /// Implementations should trigger the desired haptic effect, typically by constructing a
    /// `CHHapticPattern` and calling `playPattern(_:)`.
    ///
    /// For advanced behaviour—such as multiple players, delayed start times, or dynamic
    /// parameter curves—access `hapticEngine` directly.
    func play()
}

extension CustomHaptic {

    /// A shared `CHHapticEngine` instance managed by the haptics package.
    ///
    /// Access this engine when implementing advanced custom haptics that require direct control,
    /// including:
    /// - creating multiple players
    /// - scheduling playback using custom start times
    /// - applying dynamic parameter curves
    /// - observing engine notifications
    ///
    /// The engine is started automatically if required. Most implementations should prefer
    /// `playPattern(_:)` unless fine-grained control is needed.
    @MainActor
    public var hapticEngine: CHHapticEngine {
        get throws {
            try HapticEngineManager.shared.startEngineIfNeeded()
            return try HapticEngineManager.shared.getEngine()
        }
    }
}

extension CustomHaptic {

    /// Plays the specified haptic pattern using the shared engine.
    ///
    /// This method ensures the engine is started and executes the pattern immediately at time
    /// zero. It provides a simple path for most custom haptics and avoids the need to manage
    /// engine lifecycles.
    ///
    /// Use this helper when you only need to play a predefined pattern. For full control over
    /// playback scheduling and player configuration, access `hapticEngine` directly.
    ///
    /// - Parameter pattern: The `CHHapticPattern` to play.
    @MainActor
    public func playPattern(_ pattern: CHHapticPattern) {
        Task {
            do {
                let engine = try hapticEngine
                let player = try engine.makePlayer(with: pattern)
                try player.start(atTime: 0)
            } catch {
                print("Haptic pattern failed: \(error.localizedDescription)")
            }
        }
    }
}
