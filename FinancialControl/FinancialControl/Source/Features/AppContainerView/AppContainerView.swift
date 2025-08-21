//
//  AppContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import SwiftUI

struct AppContainerView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var authentication: AuthenticationManager
    @EnvironmentObject private var router: Router
    
    // MARK: Body
    
    var body: some View {
        if authentication.user == nil {
            UnLoggedView()
        } else {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        NavigationStack(path: $router.path) {
            HomeContainerView()
                .navigationDestination(for: Destination.self) { destination in
                    router.getDestination(from: destination)
                }
        }
    }
}
