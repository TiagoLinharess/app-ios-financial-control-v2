//
//  SideMenuView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct SideMenuView<Content: View>: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var sideMenuState: SideMenuState
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    private var isLoading: Bool
    private var onLogout: () -> Void
    @ViewBuilder private let content: Content
    
    // MARK: Init
    
    init(isLoading: Bool, onLogout: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.isLoading = isLoading
        self.onLogout = onLogout
        self.content = content()
    }
    
    // MARK: Body
    
    public var body: some View {
        ZStack {
            content
            sidebar
        }
    }
    
    // MARK: Subviews
    
    private var sidebar: some View {
        ZStack(alignment: .bottom) {
            if (sideMenuState.isExpanded) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture(perform: handleTapGesture)
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
                                action: onLogout
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
                .transition(.move(edge: .leading))
                .background(
                    Color.clear
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: sideMenuState.isExpanded)
    }
    
    // MARK: Private methods
    
    private func handleTapGesture() {
        sideMenuState.isExpanded.toggle()
    }
}
