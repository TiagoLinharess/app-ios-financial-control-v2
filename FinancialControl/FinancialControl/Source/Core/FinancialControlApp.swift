//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SwiftUI
import SwiftData

@main
struct FinancialControlApp: App {
    
    // MARK: Body
    
    var body: some Scene {
        WindowGroup {
            LocalBiometryContainerView {
                ContainerAppView()
            }
        }
        .modelContainer(for: [LocalBiometryTimestamp.self, SubPaymentType.self])
    }
}
