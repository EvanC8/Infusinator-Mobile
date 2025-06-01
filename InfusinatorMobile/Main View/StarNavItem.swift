//
//  StarNavItem.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 5/31/25.
//

import SwiftUI
import CoreHaptics

struct StarNavItem: View {
    
    @Bindable var user: User
    
    @State private var shakeAngle: Double = 0
    @State private var shakeScale: Bool = false
    
    @State var showStarCounter: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "drop.fill")
                .foregroundStyle(.theme)
//                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.theme, .theme.opacity(0.7)]), startPoint: .leading, endPoint: .trailing))
                .font(.system(size: 15, weight: .black))
                .rotationEffect(.degrees(shakeAngle))
                .animation(.easeIn(duration: 0.1), value: shakeAngle)
                .scaleEffect(shakeScale ? 1.13 : 1)
            Text("\(user.stars)")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.theme)
        }
        .padding(.trailing, 20)
        .contentShape(Rectangle())
        .onTapGesture {
            if shakeAngle == 0 {
                shake()
            }
        }
    }
    
    private func shake(delay: TimeInterval = 0, feedback: Bool = true) {
        // Shake Animation
        let angles: [Float] = [-10, 10, -8, 8, -6, 6, -3, 3, -1, 1, 0]
        
        let engine = HapticManager.prepareHaptics()
        
        let maxAngle = angles.first!.magnitude
        for (index, angle) in angles.enumerated() {
            let interval: TimeInterval = 0.15
            DispatchQueue.main.asyncAfter(deadline: .now() + delay + interval * Double(index)) {
                withAnimation(.interpolatingSpring(stiffness: 150, damping: 6)) {
                    shakeAngle = Double(angle)
                } completion: {
                    if feedback {
                        HapticManager.shakeFeedback(engine: engine, angle: angle.magnitude, maxAngle: maxAngle)
                    }
                }
            }
        }
        
        // Pulse Animation
        let animationTime = Double(delay) + (0.15 - 0.02) * Double(angles.count - 1)
        
        withAnimation(.easeOut(duration: animationTime / 2)) {
            shakeScale = true
        } completion: {
            if feedback {
                showStarCounter.toggle()
            }
            withAnimation(.easeOut(duration: animationTime / 2).delay(0.1)) {
                shakeScale = false
            }
        }
    }
}
