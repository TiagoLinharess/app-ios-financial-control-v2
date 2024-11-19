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
    
    var body: some Scene {
        WindowGroup {
            ContainerRouterView<StartView, Modules> {
                StartView()
            }
        }
    }
}
