//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics

extension HapticPreset {

    var discreteEventsAM: [CHHapticEvent]? {
        switch self {
        case .afterglow:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.3),
            transient(time: 0.075, intensity: 0.703, sharpness: 0.203),
            transient(time: 0.15, intensity: 0.5, sharpness: 0.1)
            ]

        case .aftershock:
            return [
            transient(time: 0.001, intensity: 0.8, sharpness: 0.8),
            transient(time: 0.299, intensity: 0.5, sharpness: 0.247),
            transient(time: 0.399, intensity: 0.494, sharpness: 0.266),
            transient(time: 0.5, intensity: 0.497, sharpness: 0.263)
            ]

        case .alarm:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.8),
            transient(time: 0.2, intensity: 0.9, sharpness: 0.5),
            transient(time: 0.4, intensity: 0.9, sharpness: 0.8),
            transient(time: 0.6, intensity: 0.9, sharpness: 0.5),
            transient(time: 0.8, intensity: 0.9, sharpness: 0.8),
            transient(time: 1, intensity: 0.9, sharpness: 0.5)
            ]

        case .anvil:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.15),
            transient(time: 0.08, intensity: 0.5, sharpness: 0.2)
            ]

        case .applause:
            return [
            transient(time: 0, intensity: 0.2, sharpness: 0.5),
            transient(time: 0.15, intensity: 0.25, sharpness: 0.52),
            transient(time: 0.29, intensity: 0.3, sharpness: 0.54),
            transient(time: 0.42, intensity: 0.4, sharpness: 0.56),
            transient(time: 0.54, intensity: 0.5, sharpness: 0.58),
            transient(time: 0.65, intensity: 0.484, sharpness: 0.6),
            transient(time: 0.75, intensity: 0.509, sharpness: 0.62),
            transient(time: 0.868, intensity: 0.503, sharpness: 0.65),
            transient(time: 0.968, intensity: 0.45, sharpness: 0.716),
            transient(time: 1.063, intensity: 0.434, sharpness: 0.725),
            transient(time: 1.159, intensity: 0.488, sharpness: 0.759),
            transient(time: 1.256, intensity: 0.506, sharpness: 1.0),
            transient(time: 1.349, intensity: 0.528, sharpness: 1.0),
            transient(time: 1.432, intensity: 0.519, sharpness: 1.0),
            transient(time: 1.53, intensity: 0.528, sharpness: 1.0)
            ]

        case .ascent:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.3),
            transient(time: 0.2, intensity: 0.65, sharpness: 0.37),
            transient(time: 0.38, intensity: 0.75, sharpness: 0.42),
            transient(time: 0.54, intensity: 0.85, sharpness: 0.55),
            transient(time: 0.68, intensity: 0.92, sharpness: 0.65),
            transient(time: 0.8, intensity: 0.97, sharpness: 0.73),
            transient(time: 0.9, intensity: 1.0, sharpness: 0.87)
            ]

        case .balloonPop:
            return [
            transient(time: 0, intensity: 0.1, sharpness: 0.3),
            transient(time: 0.3, intensity: 0.2, sharpness: 0.35),
            transient(time: 0.6, intensity: 0.3, sharpness: 0.4),
            transient(time: 0.9, intensity: 0.45, sharpness: 0.45),
            transient(time: 1.2, intensity: 0.6, sharpness: 0.5),
            transient(time: 1.4, intensity: 1.0, sharpness: 0.9)
            ]

        case .barrage:
            return [
            transient(time: 0.001, intensity: 0.994, sharpness: 0.994),
            transient(time: 0.051, intensity: 0.994, sharpness: 0.994),
            transient(time: 0.1, intensity: 0.991, sharpness: 0.991),
            transient(time: 0.156, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.208, intensity: 0.991, sharpness: 0.991),
            transient(time: 0.26, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.309, intensity: 1.0, sharpness: 1.0)
            ]

        case .bassDrop:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.509),
            transient(time: 0.071, intensity: 1.0, sharpness: 0.069)
            ]

        case .batter:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.35),
            transient(time: 0.06, intensity: 0.82, sharpness: 0.32),
            transient(time: 0.12, intensity: 0.95, sharpness: 0.36),
            transient(time: 0.175, intensity: 0.85, sharpness: 0.33),
            transient(time: 0.225, intensity: 1.0, sharpness: 0.38)
            ]

        case .bellToll:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.903),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.513),
            transient(time: 0.399, intensity: 0.997, sharpness: 0.147)
            ]

        case .blip:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.6)
            ]

        case .bloom:
            return [
            transient(time: 0, intensity: 0.3, sharpness: 0.5),
            transient(time: 0.12, intensity: 0.55, sharpness: 0.62)
            ]

        case .bongo:
            return [
            transient(time: 0.001, intensity: 0.594, sharpness: 0.594),
            transient(time: 0.073, intensity: 0.588, sharpness: 0.588),
            transient(time: 0.151, intensity: 0.588, sharpness: 0.588),
            transient(time: 0.299, intensity: 0.4, sharpness: 0.4),
            transient(time: 0.38, intensity: 0.394, sharpness: 0.394),
            transient(time: 0.451, intensity: 0.394, sharpness: 0.394)
            ]

        case .boulder:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.2)
            ]

        case .breakingWave:
            return [
            transient(time: 0, intensity: 0.497, sharpness: 0.497),
            transient(time: 0.089, intensity: 0.497, sharpness: 0.497),
            transient(time: 0.202, intensity: 1.0, sharpness: 0.1)
            ]

        case .breath:
            return []

        case .buildup:
            return [
            transient(time: 0.001, intensity: 0.994, sharpness: 0.053),
            transient(time: 0.051, intensity: 0.994, sharpness: 0.122),
            transient(time: 0.1, intensity: 0.991, sharpness: 0.228),
            transient(time: 0.156, intensity: 1.0, sharpness: 0.394),
            transient(time: 0.208, intensity: 0.991, sharpness: 0.613),
            transient(time: 0.26, intensity: 1.0, sharpness: 0.803),
            transient(time: 0.309, intensity: 1.0, sharpness: 1.0)
            ]

        case .burst:
            return [
            transient(time: 0, intensity: 0.2, sharpness: 0.55),
            transient(time: 0.1, intensity: 0.45, sharpness: 0.65),
            transient(time: 0.18, intensity: 0.9, sharpness: 0.7)
            ]

        case .buzz:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.85)
            ]

        case .cadence:
            return [
            transient(time: 0.001, intensity: 0.809, sharpness: 0.897),
            transient(time: 0.199, intensity: 1.0, sharpness: 0.413)
            ]

        case .cameraShutter:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.75),
            transient(time: 0.06, intensity: 0.8, sharpness: 0.7)
            ]

        case .canter:
            return [
            transient(time: 0.001, intensity: 1.0, sharpness: 0.203),
            transient(time: 0.077, intensity: 0.697, sharpness: 0.5),
            transient(time: 0.173, intensity: 0.703, sharpness: 0.244)
            ]

        case .cascade:
            return [
            transient(time: 0.001, intensity: 0.994, sharpness: 0.994),
            transient(time: 0.099, intensity: 0.997, sharpness: 0.997),
            transient(time: 0.199, intensity: 0.997, sharpness: 0.997),
            transient(time: 0.551, intensity: 0.8, sharpness: 0.8),
            transient(time: 0.649, intensity: 0.803, sharpness: 0.803),
            transient(time: 0.751, intensity: 0.797, sharpness: 0.797),
            transient(time: 1.118, intensity: 0.5, sharpness: 0.5),
            transient(time: 1.219, intensity: 0.491, sharpness: 0.491),
            transient(time: 1.318, intensity: 0.494, sharpness: 0.494),
            transient(time: 1.66, intensity: 0.497, sharpness: 0.213),
            transient(time: 1.762, intensity: 0.506, sharpness: 0.209),
            transient(time: 1.863, intensity: 0.488, sharpness: 0.213)
            ]

        case .castanets:
            return [
            transient(time: 0.001, intensity: 1.0, sharpness: 0.897),
            transient(time: 0.199, intensity: 1.0, sharpness: 0.9)
            ]

        case .catPaw:
            return [
            transient(time: 0.001, intensity: 0.6, sharpness: 0.3),
            transient(time: 0.075, intensity: 0.6, sharpness: 0.08)
            ]

        case .charge:
            return [
            transient(time: 0, intensity: 0.65, sharpness: 0.62),
            transient(time: 0.9, intensity: 0.85, sharpness: 0.68),
            transient(time: 1.6, intensity: 1.0, sharpness: 0.82)
            ]

        case .chime:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.5),
            transient(time: 0.18, intensity: 0.7, sharpness: 0.65)
            ]

        case .chip:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 1.0)
            ]

        case .chirp:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.65),
            transient(time: 0.15, intensity: 0.5, sharpness: 0.68),
            transient(time: 0.28, intensity: 0.6, sharpness: 0.72)
            ]

        case .clamor:
            return [
            transient(time: 0, intensity: 0.8, sharpness: 0.68),
            transient(time: 0.12, intensity: 0.8, sharpness: 0.68),
            transient(time: 0.24, intensity: 0.8, sharpness: 0.68),
            transient(time: 0.36, intensity: 0.8, sharpness: 0.68)
            ]

        case .clasp:
            return [
            transient(time: 0, intensity: 0.65, sharpness: 0.72),
            transient(time: 0.08, intensity: 0.9, sharpness: 0.78)
            ]

        case .cleave:
            return [
            transient(time: 0, intensity: 0.85, sharpness: 0.8),
            transient(time: 0.1, intensity: 0.7, sharpness: 0.78)
            ]

        case .coil:
            return [
            transient(time: 0, intensity: 0.2, sharpness: 0.4),
            transient(time: 0.6, intensity: 1.0, sharpness: 0.7)
            ]

        case .coinDrop:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.8),
            transient(time: 0.12, intensity: 0.7, sharpness: 0.85),
            transient(time: 0.21, intensity: 0.4, sharpness: 0.75),
            transient(time: 0.3, intensity: 0.8, sharpness: 0.9),
            transient(time: 0.38, intensity: 0.35, sharpness: 0.7),
            transient(time: 0.46, intensity: 0.6, sharpness: 0.8),
            transient(time: 0.52, intensity: 0.9, sharpness: 0.9),
            transient(time: 0.59, intensity: 0.45, sharpness: 0.75),
            transient(time: 0.65, intensity: 0.7, sharpness: 0.85)
            ]

        case .combinationLock:
            return [
            transient(time: 0, intensity: 0.62, sharpness: 0.75),
            transient(time: 0.18, intensity: 0.6, sharpness: 0.75),
            transient(time: 0.36, intensity: 0.63, sharpness: 0.75),
            transient(time: 0.54, intensity: 0.6, sharpness: 0.75),
            transient(time: 0.72, intensity: 0.62, sharpness: 0.75),
            transient(time: 0.9, intensity: 0.9, sharpness: 0.72)
            ]

        case .crescendo:
            return [
            transient(time: 0.001, intensity: 0.303, sharpness: 0.303),
            transient(time: 0.099, intensity: 0.397, sharpness: 0.397),
            transient(time: 0.202, intensity: 0.506, sharpness: 0.506),
            transient(time: 0.3, intensity: 0.609, sharpness: 0.609),
            transient(time: 0.399, intensity: 0.703, sharpness: 0.703),
            transient(time: 0.502, intensity: 0.809, sharpness: 0.809),
            transient(time: 0.601, intensity: 0.981, sharpness: 0.981)
            ]

        case .dewdrop:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.52),
            transient(time: 0.13, intensity: 0.6, sharpness: 0.65)
            ]

        case .dirge:
            return [
            transient(time: 0, intensity: 0.45, sharpness: 0.15),
            transient(time: 0.9, intensity: 0.4, sharpness: 0.13),
            transient(time: 1.9, intensity: 0.35, sharpness: 0.12)
            ]

        case .dissolve:
            return [
            transient(time: 0, intensity: 0.4, sharpness: 0.4),
            transient(time: 0.4, intensity: 0.25, sharpness: 0.2)
            ]

        case .dogBark:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.22),
            transient(time: 0.28, intensity: 0.85, sharpness: 0.22)
            ]

        case .drone:
            return [
            transient(time: 0, intensity: 0.3, sharpness: 0.45),
            transient(time: 0.5, intensity: 0.3, sharpness: 0.45),
            transient(time: 1, intensity: 0.3, sharpness: 0.45),
            transient(time: 1.5, intensity: 0.3, sharpness: 0.45)
            ]

        case .engineRev:
            return [
            transient(time: 0.7, intensity: 0.8, sharpness: 0.4),
            transient(time: 1.4, intensity: 1.0, sharpness: 0.5)
            ]

        case .exhale:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.15, intensity: 0.35, sharpness: 0.3),
            transient(time: 0.5, intensity: 0.2, sharpness: 0.15)
            ]

        case .explosion:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 0.4),
            transient(time: 0.05, intensity: 0.8, sharpness: 0.328),
            transient(time: 0.12, intensity: 0.722, sharpness: 0.256),
            transient(time: 0.187, intensity: 0.594, sharpness: 0.138)
            ]

        case .fadeOut:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.086, intensity: 0.8, sharpness: 0.8),
            transient(time: 0.192, intensity: 0.603, sharpness: 0.603),
            transient(time: 0.298, intensity: 0.406, sharpness: 0.406),
            transient(time: 0.408, intensity: 0.291, sharpness: 0.209),
            transient(time: 0.506, intensity: 0.297, sharpness: 0.075)
            ]

        case .fanfare:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.4),
            transient(time: 0.13, intensity: 0.7, sharpness: 0.55),
            transient(time: 0.25, intensity: 0.8, sharpness: 0.65),
            transient(time: 0.36, intensity: 1.0, sharpness: 0.8)
            ]

        case .feather:
            return [
            transient(time: 0, intensity: 0.45, sharpness: 0.45)
            ]

        case .finale:
            return [
            transient(time: 0.4, intensity: 0.9, sharpness: 0.65)
            ]

        case .fingerDrum:
            return [
            transient(time: 0, intensity: 0.591, sharpness: 0.591),
            transient(time: 0.1, intensity: 0.588, sharpness: 0.588),
            transient(time: 0.231, intensity: 0.6, sharpness: 0.328)
            ]

        case .firecracker:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 1.0),
            transient(time: 0.075, intensity: 1.0, sharpness: 1.0)
            ]

        case .fizz:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.65),
            transient(time: 0.12, intensity: 0.6, sharpness: 0.7),
            transient(time: 0.23, intensity: 0.7, sharpness: 0.73),
            transient(time: 0.33, intensity: 0.75, sharpness: 0.75),
            transient(time: 0.42, intensity: 0.65, sharpness: 0.7)
            ]

        case .flare:
            return [
            transient(time: 0, intensity: 0.2, sharpness: 0.7),
            transient(time: 0.06, intensity: 0.55, sharpness: 0.8),
            transient(time: 0.1, intensity: 1.0, sharpness: 0.9),
            transient(time: 0.14, intensity: 0.7, sharpness: 0.85),
            transient(time: 0.2, intensity: 0.4, sharpness: 0.75)
            ]

        case .flick:
            return [
            transient(time: 0, intensity: 0.42, sharpness: 0.5)
            ]

        case .flinch:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.75),
            transient(time: 0.12, intensity: 0.75, sharpness: 0.7),
            transient(time: 0.2, intensity: 0.4, sharpness: 0.58)
            ]

        case .flourish:
            return [
            transient(time: 0, intensity: 0.25, sharpness: 0.45),
            transient(time: 0.2, intensity: 0.7, sharpness: 0.65),
            transient(time: 0.38, intensity: 0.95, sharpness: 0.78),
            transient(time: 0.5, intensity: 0.6, sharpness: 0.62),
            transient(time: 0.584, intensity: 0.628, sharpness: 0.628),
            transient(time: 0.682, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.754, intensity: 0.456, sharpness: 0.456),
            transient(time: 0.827, intensity: 0.303, sharpness: 0.303),
            transient(time: 0.917, intensity: 0.2, sharpness: 0.2)
            ]

        case .flurry:
            return [
            transient(time: 0, intensity: 0.5, sharpness: 0.55),
            transient(time: 0.06, intensity: 0.6, sharpness: 0.6),
            transient(time: 0.115, intensity: 0.7, sharpness: 0.65),
            transient(time: 0.165, intensity: 0.85, sharpness: 0.7)
            ]

        case .flush:
            return [
            transient(time: 0, intensity: 0.25, sharpness: 0.3),
            transient(time: 0.1, intensity: 0.5, sharpness: 0.35),
            transient(time: 0.15, intensity: 0.8, sharpness: 0.3),
            transient(time: 0.2, intensity: 0.55, sharpness: 0.25)
            ]

        case .gallop:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.603),
            transient(time: 0.155, intensity: 1.0, sharpness: 0.163),
            transient(time: 0.601, intensity: 0.997, sharpness: 0.609),
            transient(time: 0.75, intensity: 1.0, sharpness: 0.153)
            ]

        case .gavel:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.106),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.609)
            ]

        case .glitch:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.9),
            transient(time: 0.03, intensity: 0.2, sharpness: 0.3),
            transient(time: 0.055, intensity: 1.0, sharpness: 0.95),
            transient(time: 0.07, intensity: 0.1, sharpness: 0.2),
            transient(time: 0.1, intensity: 0.85, sharpness: 0.85),
            transient(time: 0.13, intensity: 0.05, sharpness: 0.1),
            transient(time: 0.16, intensity: 0.95, sharpness: 0.9),
            transient(time: 0.185, intensity: 0.3, sharpness: 0.4)
            ]

        case .guitarStrum:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.55)
            ]

        case .hail:
            return [
            transient(time: 0, intensity: 0.6, sharpness: 0.7),
            transient(time: 0.04, intensity: 0.8, sharpness: 0.75),
            transient(time: 0.075, intensity: 0.4, sharpness: 0.65),
            transient(time: 0.1, intensity: 0.9, sharpness: 0.8),
            transient(time: 0.13, intensity: 0.5, sharpness: 0.7),
            transient(time: 0.165, intensity: 0.7, sharpness: 0.75),
            transient(time: 0.19, intensity: 1.0, sharpness: 0.85),
            transient(time: 0.225, intensity: 0.45, sharpness: 0.65),
            transient(time: 0.255, intensity: 0.8, sharpness: 0.78),
            transient(time: 0.285, intensity: 0.6, sharpness: 0.7),
            transient(time: 0.31, intensity: 0.9, sharpness: 0.82),
            transient(time: 0.345, intensity: 0.5, sharpness: 0.68),
            transient(time: 0.37, intensity: 0.7, sharpness: 0.74)
            ]

        case .hammer:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 0.3),
            transient(time: 0.22, intensity: 0.8, sharpness: 0.32),
            transient(time: 0.42, intensity: 0.88, sharpness: 0.3),
            transient(time: 0.59, intensity: 0.92, sharpness: 0.32),
            transient(time: 0.74, intensity: 1.0, sharpness: 0.3),
            transient(time: 0.87, intensity: 1.0, sharpness: 0.3)
            ]

        case .heartbeat:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.2),
            transient(time: 0.12, intensity: 0.6, sharpness: 0.2),
            transient(time: 0.8, intensity: 0.9, sharpness: 0.2),
            transient(time: 0.92, intensity: 0.6, sharpness: 0.2)
            ]

        case .herald:
            return [
            transient(time: 0, intensity: 0.497, sharpness: 0.497),
            transient(time: 0.089, intensity: 0.497, sharpness: 0.497),
            transient(time: 0.208, intensity: 1.0, sharpness: 1.0)
            ]

        case .hoofBeat:
            return [
            transient(time: 0.01, intensity: 1.0, sharpness: 0.106),
            transient(time: 0.201, intensity: 1.0, sharpness: 0.109)
            ]

        case .ignition:
            return [
            transient(time: 0.001, intensity: 1.0, sharpness: 0.203),
            transient(time: 0.077, intensity: 0.697, sharpness: 0.5),
            transient(time: 0.173, intensity: 1.0, sharpness: 0.703)
            ]

        case .impact:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.6),
            transient(time: 0.08, intensity: 0.5, sharpness: 0.5),
            transient(time: 0.15, intensity: 0.25, sharpness: 0.4)
            ]

        case .jolt:
            return [
            transient(time: 0, intensity: 1.0, sharpness: 1.0)
            ]

        case .keyboardMechanical:
            return [
            transient(time: 0, intensity: 0.55, sharpness: 0.68),
            transient(time: 0.022, intensity: 0.72, sharpness: 0.74)
            ]

        case .keyboardMembrane:
            return [
            transient(time: 0, intensity: 0.35, sharpness: 0.38)
            ]

        case .knell:
            return [
            transient(time: 0, intensity: 0.9, sharpness: 0.58),
            transient(time: 0.35, intensity: 0.5, sharpness: 0.5)
            ]

        case .knock:
            return [
            transient(time: 0, intensity: 0.65, sharpness: 0.35),
            transient(time: 0.28, intensity: 0.65, sharpness: 0.35),
            transient(time: 0.56, intensity: 0.65, sharpness: 0.35)
            ]

        case .lament:
            return [
            transient(time: 0, intensity: 0.85, sharpness: 0.55),
            transient(time: 0.35, intensity: 0.7, sharpness: 0.42),
            transient(time: 0.7, intensity: 0.55, sharpness: 0.37),
            transient(time: 1.05, intensity: 0.75, sharpness: 0.3)
            ]

        case .latch:
            return [
            transient(time: 0, intensity: 0.75, sharpness: 0.68),
            transient(time: 0.1, intensity: 0.4, sharpness: 0.45)
            ]

        case .lighthouse:
            return [
            transient(time: 0, intensity: 0.45, sharpness: 0.5),
            transient(time: 0.4, intensity: 0.45, sharpness: 0.5),
            transient(time: 0.8, intensity: 0.45, sharpness: 0.5)
            ]

        case .lilt:
            return [
            transient(time: 0, intensity: 0.45, sharpness: 0.52),
            transient(time: 0.16, intensity: 0.65, sharpness: 0.65)
            ]

        case .lock:
            return [
            transient(time: 0, intensity: 0.3, sharpness: 0.5),
            transient(time: 0.15, intensity: 0.9, sharpness: 0.7)
            ]

        case .lope:
            return [
            transient(time: 0, intensity: 0.7, sharpness: 0.72),
            transient(time: 0.08, intensity: 0.45, sharpness: 0.65),
            transient(time: 0.16, intensity: 0.7, sharpness: 0.72),
            transient(time: 0.24, intensity: 0.45, sharpness: 0.65),
            transient(time: 0.32, intensity: 0.75, sharpness: 0.75)
            ]
            default:
                return nil
        }
    }
}