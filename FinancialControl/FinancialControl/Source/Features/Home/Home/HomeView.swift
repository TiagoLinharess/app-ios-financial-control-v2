//
//  ContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var sideMenuState: SideMenuState
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color.background(colorScheme: colorScheme).ignoresSafeArea()
            Text("home")
                .padding(.small)
                .frame(maxWidth: Constants.Sizes.containerWidth)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: handleClickMenu) {
                    SHIcon(icon: sideMenuState.isExpanded ? .close : .menu)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                        .frame(width: .medium, height: .medium)
                }
            }
        }
    }
    
    // MARK: Private methods
    
    func handleClickMenu() {
        sideMenuState.isExpanded.toggle()
    }
}
