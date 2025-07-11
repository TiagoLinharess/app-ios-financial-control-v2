//
//  SideMenuContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SwiftUI

struct SideMenuContainerView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var sideMenu: SideMenu
    
    // MARK: Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (sideMenu.isExpanded) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture(perform: handleTapGesture)
                SideMenuView()
                    .transition(.move(edge: .leading))
                    .background(
                        Color.clear
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: sideMenu.isExpanded)
    }
    
    // MARK: Private methods
    
    private func handleTapGesture() {
        sideMenu.isExpanded.toggle()
    }
}
