//
//  AppDelegate.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import FirebaseCore
import SharpnezDesignSystemSwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
        FCSessionFactory.register(FCSessionModel() as any FCSessionModelProtocol)
        return true
    }
}
