//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics
import Foundation

/// A manager responsible for creating and maintaining a shared `CHHapticEngine` instance.
///
/// `HapticEngineManager` ensures that a single engine is reused throughout the application or
/// package, preventing premature deallocation and avoiding the overhead of repeatedly creating
/// new engine instances.
///
/// The engine is lazily instantiated and automatically started when required. Use this type when
/// implementing custom haptic patterns that rely on Core Haptics.
public final class HapticEngineManager {

    /// The shared engine manager instance.
    ///
    /// Use `HapticEngineManager.shared` to access the package-managed `CHHapticEngine`. This
    /// ensures consistent lifecycle management and prevents accidental deallocation of the
    /// engine.
    public static let shared = HapticEngineManager()

    /// The underlying `CHHapticEngine` instance.
    ///
    /// This value is created lazily on the first call to `getEngine()`. It remains alive for the
    /// lifetime of the process unless explicitly reset.
    private var engine: CHHapticEngine?

    /// Creates a new engine manager.
    ///
    /// The initializer is private to enforce the use of the shared instance.
    private init() {}

    /// Returns the shared `CHHapticEngine` instance, creating it if necessary.
    ///
    /// If the engine has already been created, this method returns the existing instance.
    /// Otherwise, it creates a new engine, stores it, and returns it.
    ///
    /// This method does not start the engine. Call `startEngineIfNeeded()` to ensure the
    /// engine is running before use.
    ///
    /// - Returns: A valid `CHHapticEngine` instance.
    /// - Throws: Any error thrown during engine creation.
    @MainActor
    public func getEngine() throws -> CHHapticEngine {
        if let engine = engine {
            return engine
        }

        let newEngine = try CHHapticEngine()
        engine = newEngine
        return newEngine
    }

    /// Starts the shared engine if it is not already running.
    ///
    /// This method guarantees that the engine is ready to play haptic patterns. If the engine
    /// has not yet been created, it will be created first.
    ///
    /// Core Haptics may stop the engine automatically under certain conditions (such as audio
    /// session interruptions). Call this method before playback to ensure the engine is in a
    /// running state.
    ///
    /// - Throws: Any error thrown while starting the engine.
    @MainActor
    public func startEngineIfNeeded() throws {
        let engine = try getEngine()

        do {
            try engine.start()
        } catch {
            throw error
        }
    }
}
