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
    
    @StateObject private var authentication: AuthenticationManager = AuthenticationManager()
    @StateObject private var router = Router()
    @StateObject private var category: Category = Category()
    @StateObject private var tag: Tag = Tag()
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
                .environmentObject(router)
                .environmentObject(category)
                .environmentObject(tag)
                .onAppear(perform: startSingleton)
        }
    }
    
    @ViewBuilder
    private var baseView: some View {
        if showLaunchScreen {
            LaunchScreenView(isShowing: $showLaunchScreen)
        } else {
            AppContainerView(viewModel: AppContainerViewModel()) // TODO: Melhorar
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                
        }
    }
    
    // MARK: Private methods
    
    private func startSingleton() {
        SessionSingleton.shared.setAuthentication(authentication)
    }
}
