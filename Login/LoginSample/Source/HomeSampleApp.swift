//
//  HomeSampleApp.swift
//  Login
//
//  Created by Tiago Linhares on 05/11/24.
//

import Login
import CoreSample
import Router
import SwiftUI

@main
struct HomeSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContainerRouterView<HomeSample<LoginFacade>, Destination<LoginFacade>> {
                HomeSample(loginFacade: LoginFacade())
            }
        }
    }
}
