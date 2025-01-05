//
//  LaunchScreenView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/11/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct LaunchScreenView: View {
    // MARK: - Properties -
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    // MARK: - Body -
    
    var body: some View {
        ZStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .rotationEffect(firstAnimation ? Angle(degrees: 900) : Angle(degrees: 1800))
                .scaleEffect(secondAnimation ? 0 : 1)
                .offset(y: secondAnimation ? 400 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primarySH)
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    // MARK: - Private Methods -
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}
