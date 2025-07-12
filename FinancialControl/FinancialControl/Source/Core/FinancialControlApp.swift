//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Firebase
import GoogleSignIn
import SharpnezDesignSystemSwiftUI
import SwiftUI

@main
struct FinancialControlApp: App {
    
    // MARK: Properties
    
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var authentication: Authentication = Authentication()
    @State private var showLaunchScreen: Bool = true
    
    // MARK: Init
    
    init() {
        FirebaseApp.configure()
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
    }
    
    // MARK: Body
    
    var body: some Scene {
        WindowGroup {
            baseView
                .environmentObject(authentication)
                .onAppear(perform: startSingleton)
        }
    }
    
    @ViewBuilder
    private var baseView: some View {
        if showLaunchScreen {
            LaunchScreenView(isShowing: $showLaunchScreen)
        } else {
            AppContainerView()
                .onAppear(perform: authentication.validateSession)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .fullScreenCover(isPresented: $authentication.presentLogin) {
                    LoginView()
                }
                .onChange(of: scenePhase) { oldValue, newValue in
                    validateScenePhase(oldValue: oldValue, newValue: newValue)
                }
        }
    }
    
    // MARK: Private methods
    
    func validateScenePhase(oldValue: ScenePhase, newValue: ScenePhase) {
        guard newValue == .active && (oldValue == .background || oldValue == .inactive) else {
            return
        }
        
        authentication.validateSession()
    }
    
    func startSingleton() {
        SessionSingleton.shared.setAuthentication(authentication)
    }
}
