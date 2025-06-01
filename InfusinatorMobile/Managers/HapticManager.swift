//
//  HapticManager.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 5/31/25.
//

import Foundation
import CoreHaptics

class HapticManager {
    static func prepareHaptics() -> CHHapticEngine? {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return nil }
        let engine: CHHapticEngine?
    
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error creating haptic engine \(error.localizedDescription)")
            return nil
        }
        
        return engine
    }
    
    static func complexFeedback(engine: CHHapticEngine?, intensity: Float, sharpness: Float) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play haptic feedback \(error.localizedDescription)")
        }
    }
    
    static func basicFeedback(engine: CHHapticEngine?) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.25)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.25)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play haptic feedback \(error.localizedDescription)")
        }
    }
    
    static func shakeFeedback(engine: CHHapticEngine?, angle: Float, maxAngle: Float) {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensityValue: Float = angle / maxAngle * 0.2
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.25)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play haptic feedback \(error.localizedDescription)")
        }
    }
}
