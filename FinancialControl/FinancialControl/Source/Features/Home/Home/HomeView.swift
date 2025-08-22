//
//  ContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @StateObject private var sideMenuState = SideMenuState()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var authentication: AuthenticationManager
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SideMenuView(isLoading: viewModel.isLoading, onLogout: handleClickLogout) {
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
        .environmentObject(sideMenuState)
        .toastView(toast: $viewModel.toast)
    }
    
    // MARK: Private methods
    
    private func handleClickMenu() {
        sideMenuState.isExpanded.toggle()
    }
    
    private func handleClickLogout() {
        Task {
            await viewModel.logout()
            authentication.user = nil // TODO: Remover a necessidade de alterar o estado aqui
            router.popToRoot()
        }
    }
}
