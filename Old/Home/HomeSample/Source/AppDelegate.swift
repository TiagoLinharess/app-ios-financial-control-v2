//
//  AppDelegate.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import CoreSample
import SharpnezDesignSystemSwiftUI
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]? = nil
    ) -> Bool {
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
        return true
    }
}
