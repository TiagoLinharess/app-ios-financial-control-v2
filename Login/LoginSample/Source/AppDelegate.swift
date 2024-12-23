//
//  AppDelegate.swift
//  Login
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

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        button.tintColor = UIColor(Color.onPrimarySH)
        navigationBar.topItem?.backBarButtonItem = button
    }
}
