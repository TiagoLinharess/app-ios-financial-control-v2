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
    @EnvironmentObject private var router: Router
    @State private var userPhoto: URL?
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SideMenuView(isLoading: viewModel.isLogoutLoading, onLogout: handleClickLogout) {
            ZStack {
                Color.background(colorScheme: colorScheme).ignoresSafeArea()
                container
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
                ToolbarItem(placement: .principal) {
                    Text(Localizable.Commons.title)
                        .configureWithSH(
                            color: .onBackground(colorScheme: colorScheme),
                            font: .body(.montserrat, .bold)
                        )
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: handleClickProfile) {
                        AsyncImage(url: userPhoto) { image in
                            image
                                .resizable()
                                .clipShape(.circle)
                                .frame(width: .superBig, height: .superBig)
                        } placeholder: {
                            SHIcon(icon: .profile)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                                .frame(width: .big, height: .big)
                        }
                    }
                }
                .sharedBackgroundVisibility(userPhoto != nil ? .hidden : .visible)
            }
        }
        .onAppear(perform: loadHome)
        .onAppear(perform: loadUserPhoto)
        .environmentObject(sideMenuState)
        .toastView(toast: $viewModel.toast)
    }
    
    private var container: some View {
        Group {
            switch viewModel.viewState {
            case .success(let model):
                HomeContentView(model: model)
                    .onAppear {
                        handleProfileExists(model: model)
                    }
            case .loading:
                SHLoading(
                    style: .large,
                    color: .onBackground(colorScheme: colorScheme)
                )
            case .failure(let message):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Commons.ops,
                    description: message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: loadHome,
                )
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleClickMenu() {
        sideMenuState.isExpanded.toggle()
    }
    
    private func handleClickProfile() {
        router.push(.profile)
    }
    
    private func loadUserPhoto() {
        userPhoto = viewModel.loadUserPhoto()
    }
    
    private func loadHome() {
        Task {
            await viewModel.loadHome()
        }
    }
    
    private func handleClickLogout() {
        Task {
            await viewModel.logout()
            router.popToRoot()
        }
    }
    
    private func handleProfileExists(model: HomeDataModel) {
        if model.profile == nil {
            viewModel.viewState = .loading
            router.push(.firstLoginForm)
        }
    }
}
