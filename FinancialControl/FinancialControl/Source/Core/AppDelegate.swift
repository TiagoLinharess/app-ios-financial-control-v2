//
//  AppDelegate.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//
import FirebaseCore
import GoogleSignIn
import SharpnezDesignSystemSwiftUI
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
        return true
    }
}
