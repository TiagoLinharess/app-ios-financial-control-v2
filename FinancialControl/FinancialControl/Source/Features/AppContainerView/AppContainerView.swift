//
//  AppContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import SwiftUI

struct AppContainerView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var authentication: Authentication
    
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
        HomeView()
    }
}
