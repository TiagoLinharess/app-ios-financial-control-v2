//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import GoogleSignIn
import SwiftUI

@main
struct FinancialControlApp: App {
    
    // MARK: Properties
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var showLaunchScreen: Bool = true
    
    // MARK: Body
    
    var body: some Scene {
        WindowGroup {
            appView
        }
    }
    
    @ViewBuilder
    private var appView: some View {
        if showLaunchScreen {
            LaunchScreenView(isShowing: $showLaunchScreen)
        } else {
            AppContainerView(viewModel: AppContainerViewModel())
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
