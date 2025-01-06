//
//  LaunchScreenView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezDesignSystemUIKit
import SwiftUI

struct LaunchScreenView: View {
    
    // MARK: Properties
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    
    var onFinish: (() -> Void)?
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .rotationEffect(firstAnimation ? Angle(degrees: 1080) : Angle(degrees: 1800))
                .scaleEffect(secondAnimation ? 0 : 1)
                .offset(y: secondAnimation ? 400 : 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, .large)
                .background(Color.backgroundSH)
        }
        .onAppear {
            updateAnimation()
        }
    }
    
    // MARK: Private Methods
    
    private func updateAnimation() {
        Task {
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
            try? await Task.sleep(for: .seconds(0.9))
            withAnimation(.linear) {
                self.secondAnimation = true
            }
            try? await Task.sleep(for: .seconds(0.3))
            onFinish?()
        }
    }
}
