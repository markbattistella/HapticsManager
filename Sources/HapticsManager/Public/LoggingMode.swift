//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import Foundation

// MARK: - LoggingMode Enum

/// Enum representing the logging modes for haptics, with configurable thresholds.
public enum LoggingMode: Sendable {
    
    /// A smart logging mode with rate-limiting thresholds for logs and skipped logs.
    case smart(skipLogThreshold: TimeInterval = 50, logThreshold: TimeInterval = 15 * 60)
    
    /// A complete logging mode with a threshold for logs.
    case complete(logThreshold: TimeInterval = 5 * 60)
    
    /// Convenience property for smart logging mode with default thresholds.
    public static var smart: LoggingMode { .smart() }
    
    /// Convenience property for complete logging mode with default threshold.
    public static var complete: LoggingMode { .complete() }
    
    /// Checks if the logging mode is smart.
    internal var isSmart: Bool {
        switch self {
            case .smart: return true
            default: return false
        }
    }
    
    /// Checks if the logging mode is complete.
    internal var isComplete: Bool {
        switch self {
            case .complete: return true
            default: return false
        }
    }
}

#endif
