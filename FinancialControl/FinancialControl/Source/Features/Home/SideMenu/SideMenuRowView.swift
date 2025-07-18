//
//  SideMenuRowView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct SideMenuRowView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var sideMenu: SideMenu
    @EnvironmentObject private var router: Router
    private let feature: SideMenuFeature
    
    // MARK: Init
    
    init(feature: SideMenuFeature) {
        self.feature = feature
    }
    
    // MARK: Body
    
    var body: some View {
        HStack(spacing: .extraSmall) {
            SHIcon(icon: feature.icon)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(Color.onSurface(colorScheme: colorScheme))
                .frame(width: .big, height: .big)
            Text(feature.title)
                .configureWithSH(
                    color: .onSurface(colorScheme: colorScheme),
                    font: .body(.poppins, .regular)
                )
                .lineLimit(1)
            Spacer()
            SHIcon(icon: .chevronRight)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(Color.onSurface(colorScheme: colorScheme))
                .frame(width: .medium, height: .medium)
        }
        .padding(.small)
        .background(Color.surface(colorScheme: colorScheme).ignoresSafeArea())
        .clipShape(RoundedRectangle(cornerRadius: .small))
        .padding(.bottom, .extraSmall)
        .onTapGesture(perform: handleTap)
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        sideMenu.isExpanded.toggle()
        router.push(feature.toDestination)
    }
}
