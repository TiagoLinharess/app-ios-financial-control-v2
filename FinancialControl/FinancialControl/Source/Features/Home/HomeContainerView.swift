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
    
    @EnvironmentObject private var sideMenu: SideMenu
    
    // MARK: Body
    
    var body: some View {
        ZStack{
            HomeView()
            SideMenuContainerView()
        }
    }
}
