//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import DefaultsKit
import CoreHaptics.CHHapticEngine

/// A class that provides access to haptic and logging settings stored in UserDefaults.
///
/// This class retrieves values using specified keys and provides default values if none are set.
/// It conforms to the `HapticSettings` protocol to ensure compatibility with the HapticsManager.
internal final class HapticUserDefaultsSettings: HapticSettings {
    
    /// Indicates whether the device is capable of haptic feedback.
    private let hapticCapableKey: Bool
    
    /// The key for storing whether haptic feedback is enabled.
    private let hapticEnabledKey: any UserDefaultsKeyRepresentable
    
    /// The key for storing whether logging is enabled.
    private let hapticLoggingEnabledKey: any UserDefaultsKeyRepresentable
    
    /// The key for storing the logging threshold value.
    private let hapticLoggingThresholdKey: any UserDefaultsKeyRepresentable
    
    /// The key for storing the logging cooldown period.
    private let hapticLoggingCooldownKey: any UserDefaultsKeyRepresentable
    
    /// Default threshold for logging attempts before logging is allowed.
    private let defaultThreshold: Int = 20
    
    /// Default cooldown period in seconds before allowing another log.
    private let defaultCooldown: TimeInterval = 120
    
    /// Initializes a new instance of `HapticUserDefaultsSettings` with the specified keys.
    ///
    /// - Parameters:
    ///   - hapticEnabledKey: The key for storing whether haptic feedback is enabled.
    ///   - loggingEnabledKey: The key for storing whether logging is enabled.
    ///   - loggingThresholdKey: The key for storing the logging threshold.
    ///   - loggingCooldownKey: The key for storing the logging cooldown period.
    internal init(
        hapticEnabledKey: any UserDefaultsKeyRepresentable,
        hapticLoggingEnabledKey: any UserDefaultsKeyRepresentable,
        hapticLoggingThresholdKey: any UserDefaultsKeyRepresentable,
        hapticLoggingCooldownKey: any UserDefaultsKeyRepresentable
    ) {
        self.hapticCapableKey = CHHapticEngine.capabilitiesForHardware().supportsHaptics
        self.hapticEnabledKey = hapticEnabledKey
        self.hapticLoggingEnabledKey = hapticLoggingEnabledKey
        self.hapticLoggingThresholdKey = hapticLoggingThresholdKey
        self.hapticLoggingCooldownKey = hapticLoggingCooldownKey
    }
    
    /// A Boolean value indicating whether the device supports haptic feedback.
    internal var isCapable: Bool {
        hapticCapableKey
    }
    
    /// A Boolean value indicating whether haptic feedback is enabled based on user settings.
    internal var isEnabled: Bool {
        UserDefaults.standard.bool(for: hapticEnabledKey)
    }
    
    /// A Boolean value indicating whether logging is enabled for haptic actions.
    internal var isLoggingEnabled: Bool {
        UserDefaults.standard.bool(for: hapticLoggingEnabledKey)
    }
    
    /// The logging threshold value, with a default if not set.
    internal var loggingThreshold: Int {
        UserDefaults.standard.integer(for: hapticLoggingThresholdKey) > 0
        ? UserDefaults.standard.integer(for: hapticLoggingThresholdKey)
        : defaultThreshold
    }
    
    /// The logging cooldown value, with a default if not set.
    internal var loggingCooldown: TimeInterval {
        UserDefaults.standard.double(for: hapticLoggingCooldownKey) > 0
        ? UserDefaults.standard.double(for: hapticLoggingCooldownKey)
        : defaultCooldown
    }
}
