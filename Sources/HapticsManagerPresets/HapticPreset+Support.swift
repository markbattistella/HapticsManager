//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics

extension HapticPreset {

    struct ContinuousEnvelope {
        struct ControlPoint {
            let time: TimeInterval
            let value: Float
        }

        let startTime: TimeInterval
        let duration: TimeInterval
        let amplitudePoints: [ControlPoint]
        let frequencyPoints: [ControlPoint]
    }

    var events: [CHHapticEvent] {
        discreteEvents + continuousEvents
    }

    var discretePattern: CHHapticPattern? {
        guard !discreteEvents.isEmpty else { return nil }
        return try? CHHapticPattern(events: discreteEvents, parameters: [])
    }

    var discreteEvents: [CHHapticEvent] {
        discreteEventsAM ?? discreteEventsNZ ?? []
    }

    var continuousEnvelope: ContinuousEnvelope? {
        continuousEnvelopeAM ?? continuousEnvelopeNZ
    }

    var playableContinuousEnvelope: ContinuousEnvelope? {
        guard
            let envelope = continuousEnvelope,
            !envelope.amplitudePoints.isEmpty,
            !envelope.frequencyPoints.isEmpty
        else {
            return nil
        }

        return envelope
    }

    var continuousPattern: CHHapticPattern? {
        guard playableContinuousEnvelope != nil else { return nil }

        return try? CHHapticPattern(
            events: continuousEvents,
            parameterCurves: parameterCurves
        )
    }

    var parameterCurves: [CHHapticParameterCurve] {
        guard let envelope = playableContinuousEnvelope else { return [] }

        let intensityCurve = CHHapticParameterCurve(
            parameterID: .hapticIntensityControl,
            controlPoints: envelope.amplitudePoints.map {
                CHHapticParameterCurve.ControlPoint(relativeTime: $0.time, value: $0.value)
            },
            relativeTime: envelope.startTime
        )

        let sharpnessCurve = CHHapticParameterCurve(
            parameterID: .hapticSharpnessControl,
            controlPoints: envelope.frequencyPoints.map {
                CHHapticParameterCurve.ControlPoint(relativeTime: $0.time, value: $0.value)
            },
            relativeTime: envelope.startTime
        )

        return [intensityCurve, sharpnessCurve]
    }

    var continuousEvents: [CHHapticEvent] {
        guard let envelope = playableContinuousEnvelope else { return [] }
        return [
            continuous(
                time: envelope.startTime,
                duration: envelope.duration,
                intensity: 1,
                sharpness: 0
            )
        ]
    }

    func transient(
        time: TimeInterval,
        intensity: Float,
        sharpness: Float
    ) -> CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            ],
            relativeTime: time
        )
    }

    func continuous(
        time: TimeInterval,
        duration: TimeInterval,
        intensity: Float,
        sharpness: Float
    ) -> CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
            ],
            relativeTime: time,
            duration: duration
        )
    }
}
