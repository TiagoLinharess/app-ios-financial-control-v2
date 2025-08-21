//
//  LaunchScreenView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct LaunchScreenView: View {
    
    // MARK: Properties
    
    @State private var isLogoBounced = false
    @State private var isLogoHidden = false
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding private var isShowing: Bool
    
    // MARK: Init
    
    init(isShowing: Binding<Bool>) {
        self._isShowing = isShowing
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color.background(colorScheme: colorScheme)
                .ignoresSafeArea()
            Image(Constants.Images.logo)
                .resizable()
                .scaledToFit()
                .frame(width: .xxGiant, height: .xxGiant)
                .scaleEffect(isLogoHidden ? 0 : 1)
                .offset(y: (isLogoBounced ? -80 : 0) + (isLogoHidden ? 400 : 0))
                .padding(.bottom, .large)
        }
        .onAppear {
            startAnimationSequence()
        }
    }
    
    // MARK: Private Methods
    
    private func startAnimationSequence() {
        Task {
            withAnimation(.interpolatingSpring(stiffness: 180, damping: 8)) {
                isLogoBounced.toggle()
            }
            try? await Task.sleep(for: .seconds(0.9))
            withAnimation(.linear) {
                isLogoHidden = true
            }
            try? await Task.sleep(for: .seconds(0.3))
            withAnimation {
                isShowing = false
            }
        }
    }
}
