//
//  MainTabView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeContainerView: View {
    
    // MARK: Properties
    
    @StateObject private var sideMenuState = SideMenuState()
    
    // MARK: Body
    
    var body: some View {
        ZStack{
            HomeView()
            SideMenuView(viewModel: SideMenuViewModel()) // TODO: Melhorar
        }
        .environmentObject(sideMenuState)
    }
}
