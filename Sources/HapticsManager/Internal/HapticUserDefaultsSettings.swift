//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import Foundation
import DefaultsKit
import CoreHaptics.CHHapticEngine

// MARK: - HapticUserDefaultsSettings Class

/// A class that manages haptic settings stored in user defaults.
internal final class HapticUserDefaultsSettings: HapticSettings {
    
    /// The user defaults object for storing settings.
    private let defaults = UserDefaults.standard
    
    /// Indicates if the device supports haptic feedback.
    private let hapticCapableKey: Bool
    
    /// The key used to check if haptic feedback is enabled.
    private let hapticEnabledKey: any UserDefaultsKeyRepresentable
    
    /// The key used to check if haptic logging is enabled.
    private let hapticLoggingEnabledKey: any UserDefaultsKeyRepresentable
    
    /// Initializes the settings object with user defaults keys for haptic feedback and logging.
    ///
    /// - Parameters:
    ///   - hapticEnabledKey: The key to check if haptic feedback is enabled.
    ///   - hapticLoggingEnabledKey: The key to check if haptic logging is enabled.
    internal init(
        hapticEnabledKey: any UserDefaultsKeyRepresentable,
        hapticLoggingEnabledKey: any UserDefaultsKeyRepresentable
    ) {
        self.hapticCapableKey = CHHapticEngine.capabilitiesForHardware().supportsHaptics
        self.hapticEnabledKey = hapticEnabledKey
        self.hapticLoggingEnabledKey = hapticLoggingEnabledKey
    }
    
    /// Indicates if the device is capable of haptic feedback.
    internal var isCapable: Bool { hapticCapableKey }
    
    /// Indicates if haptic feedback is enabled based on user settings.
    internal var isEnabled: Bool { defaults.bool(for: hapticEnabledKey) }
    
    /// Indicates if haptic logging is enabled based on user settings.
    internal var isLoggingEnabled: Bool { defaults.bool(for: hapticLoggingEnabledKey) }
}

#endif
