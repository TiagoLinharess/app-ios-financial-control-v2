//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import GoogleSignIn
import Firebase
import SharpnezDesignSystemSwiftUI
import SwiftUI

@main
struct FinancialControlApp: App {
    
    // MARK: Properties
    
    @State private var showLaunchScreen: Bool = true
    
    // MARK: Init
    
    init() {
        FirebaseApp.configure()
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
    }
    
    // MARK: Body
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showLaunchScreen {
                    LaunchScreenView {
                        withAnimation {
                            showLaunchScreen = false
                        }
                    }
                } else {
                    AppContainerView()
                }
            }
            .onOpenURL { url in
                GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
