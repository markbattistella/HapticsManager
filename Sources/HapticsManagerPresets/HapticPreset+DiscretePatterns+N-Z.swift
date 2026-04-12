//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics

extension HapticPreset {

    var discreteEventsNZ: [CHHapticEvent]? {
        switch self {
        case .nudge:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.5),
            transient(time: 0.12, intensity: 0.4, sharpness: 0.5)
            ]

        case .passingCar:
            return []

        case .patter:
            return [
            transient(time: 0, intensity: 0.603, sharpness: 0.2),
            transient(time: 0.082, intensity: 0.606, sharpness: 0.197),
            transient(time: 0.179, intensity: 0.609, sharpness: 0.594)
            ]

        case .peal:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 0.62),
            transient(time: 0.18, intensity: 0.75, sharpness: 0.62),
            transient(time: 0.36, intensity: 0.75, sharpness: 0.62)
            ]

        case .peck:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.58)
            ]

        case .pendulum:
            return [
            transient(time: 0.3, intensity: 0.12, sharpness: 0.35),
            transient(time: 0.9, intensity: 0.08, sharpness: 0.35),
            transient(time: 1.5, intensity: 0.05, sharpness: 0.35),
            transient(time: 2.1, intensity: 0.02, sharpness: 0.35)
            ]

        case .ping:
            return [
            transient(time: 0, intensity: 0.65, sharpness: 0.72)
            ]

        case .pip:
            return [
            transient(time: 0, intensity: 0.35, sharpness: 0.65),
            transient(time: 0.06, intensity: 0.25, sharpness: 0.7)
            ]

        case .piston:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.397),
            transient(time: 0.073, intensity: 1.0, sharpness: 0.397)
            ]

        case .plink:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.52),
            transient(time: 0.15, intensity: 0.55, sharpness: 0.52)
            ]

        case .plummet:
            return [
            transient(time: 0.9, intensity: 1.0, sharpness: 0.4)
            ]

        case .plunk:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.2)
            ]

        case .poke:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.1, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.2, intensity: 0.7, sharpness: 0.65)
            ]

        case .pound:
            return [
            transient(time: 0, intensity: 0.95, sharpness: 0.7),
            transient(time: 0.1, intensity: 0.95, sharpness: 0.7),
            transient(time: 0.2, intensity: 0.95, sharpness: 0.7)
            ]

        case .powerDown:
            return [
            transient(time: 0, intensity: 0.8, sharpness: 0.6)
            ]

        case .propel:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.58),
            transient(time: 0.12, intensity: 0.9, sharpness: 0.72)
            ]

        case .pulse:
            return []

        case .pummel:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.85),
            transient(time: 0.07, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.13, intensity: 0.95, sharpness: 0.87),
            transient(time: 0.19, intensity: 0.8, sharpness: 0.83),
            transient(time: 0.25, intensity: 1.0, sharpness: 0.88)
            ]

        case .push:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.52)
            ]

        case .radar:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.55),
            transient(time: 0.8, intensity: 0.55, sharpness: 0.55),
            transient(time: 1.6, intensity: 0.55, sharpness: 0.55),
            transient(time: 2.4, intensity: 0.55, sharpness: 0.55)
            ]

        case .rain:
            return [
            transient(time: 0, intensity: 0.2, sharpness: 0.6),
            transient(time: 0.08, intensity: 0.15, sharpness: 0.5),
            transient(time: 0.15, intensity: 0.3, sharpness: 0.7),
            transient(time: 0.21, intensity: 0.1, sharpness: 0.5),
            transient(time: 0.31, intensity: 0.25, sharpness: 0.6),
            transient(time: 0.38, intensity: 0.2, sharpness: 0.55),
            transient(time: 0.46, intensity: 0.35, sharpness: 0.65),
            transient(time: 0.52, intensity: 0.1, sharpness: 0.5),
            transient(time: 0.61, intensity: 0.2, sharpness: 0.6),
            transient(time: 0.7, intensity: 0.15, sharpness: 0.55),
            transient(time: 0.76, intensity: 0.3, sharpness: 0.7),
            transient(time: 0.85, intensity: 0.2, sharpness: 0.6)
            ]

        case .ramp:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.5),
            transient(time: 0.12, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.24, intensity: 0.8, sharpness: 0.7),
            transient(time: 0.38, intensity: 1.0, sharpness: 0.8)
            ]

        case .rap:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.5),
            transient(time: 0.12, intensity: 0.4, sharpness: 0.5)
            ]

        case .ratchet:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.9),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.906),
            transient(time: 0.398, intensity: 0.997, sharpness: 0.906)
            ]

        case .rebound:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.08, intensity: 1.0, sharpness: 0.3)
            ]

        case .ripple:
            return [
            transient(time: 0, intensity: 0.858, sharpness: 0.72),
            transient(time: 0.14, intensity: 0.52, sharpness: 0.48),
            transient(time: 0.26, intensity: 0.22, sharpness: 0.32),
            transient(time: 0.36, intensity: 0.08, sharpness: 0.2)
            ]

        case .rivet:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.075, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.15, intensity: 1.0, sharpness: 1.0)
            ]

        case .rustle:
            return []

        case .shockwave:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.35),
            transient(time: 0.2, intensity: 0.4, sharpness: 0.3),
            transient(time: 0.45, intensity: 0.15, sharpness: 0.25)
            ]

        case .snap:
            return [
            transient(time: 0, intensity: 0.7, sharpness: 0.55),
            transient(time: 0.04, intensity: 0.3, sharpness: 0.48)
            ]

        case .sonar:
            return [
            transient(time: 0, intensity: 0.35, sharpness: 0.7),
            transient(time: 0.6, intensity: 0.35, sharpness: 0.7),
            transient(time: 1.2, intensity: 0.35, sharpness: 0.7),
            transient(time: 1.8, intensity: 0.65, sharpness: 0.65),
            transient(time: 1.92, intensity: 0.4, sharpness: 0.6)
            ]

        case .spark:
            return [
            transient(time: 0, intensity: 0.22, sharpness: 0.55),
            transient(time: 0.065, intensity: 0.52, sharpness: 0.78),
            transient(time: 0.138, intensity: 1.0, sharpness: 1.0)
            ]

        case .spin:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.55),
            transient(time: 0.25, intensity: 0.4, sharpness: 0.55),
            transient(time: 0.5, intensity: 0.4, sharpness: 0.55),
            transient(time: 0.75, intensity: 0.4, sharpness: 0.55),
            transient(time: 1, intensity: 0.4, sharpness: 0.55),
            transient(time: 1.25, intensity: 0.4, sharpness: 0.55),
            transient(time: 1.5, intensity: 0.4, sharpness: 0.55),
            transient(time: 1.75, intensity: 0.4, sharpness: 0.55)
            ]

        case .stagger:
            return [
            transient(time: 0, intensity: 0.7, sharpness: 0.55),
            transient(time: 0.06, intensity: 0.4, sharpness: 0.65),
            transient(time: 0.12, intensity: 0.55, sharpness: 0.5),
            transient(time: 0.18, intensity: 0.35, sharpness: 0.6)
            ]

        case .stamp:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.5),
            transient(time: 0.15, intensity: 0.55, sharpness: 0.5)
            ]

        case .stampede:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.306),
            transient(time: 0.155, intensity: 1.0, sharpness: 0.163),
            transient(time: 0.601, intensity: 0.997, sharpness: 0.303),
            transient(time: 0.75, intensity: 1.0, sharpness: 0.153)
            ]

        case .stomp:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.3),
            transient(time: 0.075, intensity: 1.0, sharpness: 0.3),
            transient(time: 0.15, intensity: 1.0, sharpness: 0.3)
            ]

        case .stoneSkip:
            return [
            transient(time: 0.001, intensity: 0.706, sharpness: 0.706),
            transient(time: 0.077, intensity: 0.697, sharpness: 0.5),
            transient(time: 0.181, intensity: 0.703, sharpness: 0.244)
            ]

        case .strike:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 0.62)
            ]

        case .summon:
            return [
            transient(time: 0, intensity: 0.8, sharpness: 0.55),
            transient(time: 0.3, intensity: 0.7, sharpness: 0.6),
            transient(time: 0.43, intensity: 0.7, sharpness: 0.6)
            ]

        case .surge:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.82),
            transient(time: 0.075, intensity: 0.62, sharpness: 0.86),
            transient(time: 0.145, intensity: 0.74, sharpness: 0.9),
            transient(time: 0.21, intensity: 0.8, sharpness: 0.92)
            ]

        case .sway:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.25),
            transient(time: 0.7, intensity: 0.5, sharpness: 0.25),
            transient(time: 1.4, intensity: 0.5, sharpness: 0.25)
            ]

        case .sweep:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.7),
            transient(time: 0.6, intensity: 0.4, sharpness: 0.7),
            transient(time: 1.2, intensity: 0.4, sharpness: 0.7),
            transient(time: 1.8, intensity: 0.4, sharpness: 0.7)
            ]

        case .swell:
            return [
            transient(time: 0, intensity: 0.45, sharpness: 0.48),
            transient(time: 0.35, intensity: 0.65, sharpness: 0.52)
            ]

        case .syncopate:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.903),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.513),
            transient(time: 0.399, intensity: 0.997, sharpness: 0.906)
            ]

        case .throb:
            return [
            transient(time: 0, intensity: 0.8, sharpness: 0.65),
            transient(time: 0.15, intensity: 0.45, sharpness: 0.6)
            ]

        case .thud:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.42)
            ]

        case .thump:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.45)
            ]

        case .thunder:
            return [
            transient(time: 0.6, intensity: 1.0, sharpness: 0.15),
            transient(time: 0.7, intensity: 0.8, sharpness: 0.12),
            transient(time: 0.9, intensity: 0.5, sharpness: 0.1),
            transient(time: 1.2, intensity: 0.3, sharpness: 0.08)
            ]

        case .thunderRoll:
            return [
            transient(time: 0.001, intensity: 0.994, sharpness: 0.053),
            transient(time: 0.051, intensity: 0.994, sharpness: 0.122),
            transient(time: 0.1, intensity: 0.991, sharpness: 0.228),
            transient(time: 0.156, intensity: 1.0, sharpness: 0.394),
            transient(time: 0.208, intensity: 0.991, sharpness: 0.613),
            transient(time: 0.26, intensity: 1.0, sharpness: 0.803),
            transient(time: 0.309, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.368, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.42, intensity: 0.8, sharpness: 0.8),
            transient(time: 0.482, intensity: 0.606, sharpness: 0.606),
            transient(time: 0.544, intensity: 0.394, sharpness: 0.394),
            transient(time: 0.605, intensity: 0.194, sharpness: 0.194),
            transient(time: 0.67, intensity: 0.091, sharpness: 0.091)
            ]

        case .tickTock:
            return [
            transient(time: 0.001, intensity: 0.8, sharpness: 0.8),
            transient(time: 0.4, intensity: 0.4, sharpness: 0.4),
            transient(time: 0.8, intensity: 0.8, sharpness: 0.8),
            transient(time: 1.2, intensity: 0.4, sharpness: 0.4)
            ]

        case .tidalSurge:
            return [
            transient(time: 0.001, intensity: 0.594, sharpness: 0.594),
            transient(time: 0.073, intensity: 0.588, sharpness: 0.588),
            transient(time: 0.151, intensity: 0.588, sharpness: 0.588),
            transient(time: 0.299, intensity: 1.0, sharpness: 0.3),
            transient(time: 0.38, intensity: 1.0, sharpness: 0.303),
            transient(time: 0.455, intensity: 1.0, sharpness: 0.3)
            ]

        case .tideSwell:
            return [
            transient(time: 0.001, intensity: 0.775, sharpness: 0.053),
            transient(time: 0.051, intensity: 0.722, sharpness: 0.122),
            transient(time: 0.1, intensity: 0.7, sharpness: 0.228),
            transient(time: 0.156, intensity: 0.653, sharpness: 0.394),
            transient(time: 0.208, intensity: 0.638, sharpness: 0.613),
            transient(time: 0.26, intensity: 0.622, sharpness: 0.803),
            transient(time: 0.309, intensity: 0.606, sharpness: 1.0),
            transient(time: 0.368, intensity: 0.6, sharpness: 1.0),
            transient(time: 0.42, intensity: 0.606, sharpness: 0.8),
            transient(time: 0.482, intensity: 0.609, sharpness: 0.606),
            transient(time: 0.549, intensity: 0.647, sharpness: 0.394),
            transient(time: 0.605, intensity: 0.684, sharpness: 0.181),
            transient(time: 0.67, intensity: 0.728, sharpness: 0.075),
            transient(time: 0.727, intensity: 0.775, sharpness: 0.034)
            ]

        case .tremor:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.0)
            ]

        case .trigger:
            return [
            transient(time: 0, intensity: 0.872, sharpness: 0.7),
            transient(time: 0.08, intensity: 0.5, sharpness: 0.55),
            transient(time: 0.2, intensity: 0.25, sharpness: 0.45)
            ]

        case .triumph:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.55),
            transient(time: 0.12, intensity: 0.55, sharpness: 0.6),
            transient(time: 0.26, intensity: 0.7, sharpness: 0.65),
            transient(time: 0.42, intensity: 0.85, sharpness: 0.7),
            transient(time: 0.6, intensity: 1.0, sharpness: 0.8),
            transient(time: 0.75, intensity: 1.0, sharpness: 0.8),
            transient(time: 0.9, intensity: 1.0, sharpness: 0.8)
            ]

        case .trumpet:
            return [
            transient(time: 0, intensity: 0.3, sharpness: 0.5),
            transient(time: 0.08, intensity: 0.4, sharpness: 0.55),
            transient(time: 0.15, intensity: 0.5, sharpness: 0.6),
            transient(time: 0.21, intensity: 0.6, sharpness: 0.65),
            transient(time: 0.26, intensity: 0.7, sharpness: 0.7),
            transient(time: 0.31, intensity: 1.0, sharpness: 0.85)
            ]

        case .typewriter:
            return [
            transient(time: 0, intensity: 0.88, sharpness: 0.42),
            transient(time: 0.055, intensity: 0.35, sharpness: 0.38),
            transient(time: 0.11, intensity: 0.12, sharpness: 0.35)
            ]

        case .unfurl:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.28),
            transient(time: 0.09, intensity: 0.62, sharpness: 0.4),
            transient(time: 0.18, intensity: 0.74, sharpness: 0.49),
            transient(time: 0.27, intensity: 0.86, sharpness: 0.62),
            transient(time: 0.36, intensity: 1.0, sharpness: 0.7)
            ]

        case .vortex:
            return [
            transient(time: 1.2, intensity: 1.0, sharpness: 0.8)
            ]

        case .wane:
            return []

        case .warDrum:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.106),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.109),
            transient(time: 0.398, intensity: 0.997, sharpness: 0.103)
            ]

        case .waterfall:
            return [
            transient(time: 0.001, intensity: 0.994, sharpness: 0.994),
            transient(time: 0.051, intensity: 0.994, sharpness: 0.806),
            transient(time: 0.1, intensity: 0.991, sharpness: 0.597),
            transient(time: 0.156, intensity: 1.0, sharpness: 0.394),
            transient(time: 0.208, intensity: 0.991, sharpness: 0.203),
            transient(time: 0.26, intensity: 1.0, sharpness: 0.094),
            transient(time: 0.309, intensity: 1.0, sharpness: 0.072)
            ]

        case .wave:
            return []

        case .wisp:
            return [
            transient(time: 0, intensity: 0.25, sharpness: 0.48)
            ]

        case .wobble:
            return []

        case .woodpecker:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.045, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.09, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.135, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.18, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.225, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.27, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.315, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.36, intensity: 0.75, sharpness: 0.82),
            transient(time: 0.405, intensity: 0.75, sharpness: 0.82)
            ]
            default:
                return nil
        }
    }
}