//
//  SideMenuView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct SideMenuView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var sideMenu: SideMenu
    @EnvironmentObject private var authentication: Authentication
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isLoading: Bool = false
    @State private var toast: SHToastViewModel?
    
    // MARK: Body
    
    public var body: some View {
        HStack {
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: Constants.Sizes.sideBarWidth)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                VStack(alignment: .center, spacing: .small) {
                    Text(Localizable.Commons.menu)
                        .configureWithSH(
                            color: .onBackground(colorScheme: colorScheme),
                            font: .title3(.poppins, .regular)
                        )
                    ScrollView(.vertical) {
                        ForEach(SideMenuFeature.allCases, id: \.self){ feature in
                            SideMenuRowView(feature: feature)
                        }
                    }
                    .scrollBounceBehavior(.basedOnSize)
                    Spacer()
                    SHButton(
                        title: Localizable.Commons.signOut,
                        style: .primary(
                            .error(colorScheme: colorScheme),
                            .onError(colorScheme: colorScheme)
                        ),
                        font: .montserrat,
                        isLoading: isLoading,
                        action: handleClickLogout
                    )
#if os(iOS)
                    .padding(.bottom, .small)
#endif
                }
                .padding(.top, Constants.Sizes.sideBarTopPadding)
                .padding(.small)
                .frame(width: Constants.Sizes.sideBarWidth)
                .background(
                    Color.background(colorScheme: colorScheme)
                )
            }
            Spacer()
        }
        .background(.clear)
        .toastView(toast: $toast)
    }
    
    // MARK: Private methods
    
    func handleClickLogout() {
        Task {
            defer { isLoading = false }
            sideMenu.isExpanded.toggle()
            isLoading = true
            do {
                try await authentication.logout()
            } catch {
                toast = SHToastViewModel(
                    style: .error,
                    font: .montserrat,
                    message: error.localizedDescription
                )
            }
        }
    }
}
