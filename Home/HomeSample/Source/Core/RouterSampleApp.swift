//
//  RouterSampleApp.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import Home
import Router
import SwiftUI

@main
struct RouterSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContainerRouterView {
                HomeView()
            }
        }
    }
}
