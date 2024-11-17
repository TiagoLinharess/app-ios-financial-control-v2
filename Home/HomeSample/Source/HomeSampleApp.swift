//
//  HomeSampleApp.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import Home
import Router
import SwiftUI

@main
struct HomeSampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContainerRouterView<HomeSample, Destination<HomeFacade>> {
                HomeSample(homeFacade: HomeFacade())
            }
        }
    }
}
