//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/11/24.
//

import Router
import SwiftUI

@main
struct FinancialControlApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var launchScreenState = LaunchScreenStateManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContainerRouterView<StartView, Modules> {
                    StartView()
                }
                
                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
