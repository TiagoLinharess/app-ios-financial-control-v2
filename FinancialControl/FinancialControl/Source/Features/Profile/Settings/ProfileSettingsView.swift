//
//  ProfileSettingsView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 26/09/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ProfileSettingsView<ViewModel: ProfileSettingsViewModelProtocol>: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var router: Router
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel: ViewModel
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: Localizable.ProfileSettings.title) {
            VStack {
                ScrollView {
                    LazyVStack(spacing: .small) {
                        ForEach(ProfileSettingsItemType.allCases, id: \.self){ feature in
                            MenuRowView(feature: feature)
                                .onTapGesture {
                                    handleTapItem(feature: feature)
                                }
                        }
                    }
                    .padding(.small)
                }
                Spacer()
                VStack(spacing: .small) {
                    SHButton(
                        title: Localizable.Commons.signOut,
                        style: .primary(.error(colorScheme: colorScheme), .onError(colorScheme: colorScheme)),
                        font: .montserrat,
                        isLoading: viewModel.isSignOutLoading,
                        action: handleLogout
                    )
                    SHButton(
                        title: Localizable.ProfileSettings.deleteAccount,
                        style: .secondary(.error(colorScheme: colorScheme)),
                        font: .montserrat,
                        isLoading: viewModel.isSignOutLoading,
                        action: handleShowDeleteModal
                    )
                }
                .padding(.small)
            }
            .toastView(toast: $viewModel.toast)
            .modal(isPresented: $viewModel.isDeleteModalPresented) {
                ProfileSettingsDeleteView(
                    action: handleDelete,
                    isPresented: $viewModel.isDeleteModalPresented,
                    isDeleteLoading: viewModel.isDeleteLoading
                )
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleTapItem(feature: ProfileSettingsItemType) {
        router.push(feature.toDestination)
    }
    
    private func handleLogout() {
        Task {
            await viewModel.handleLogout()
            router.popToRoot()
        }
    }
    
    private func handleShowDeleteModal() {
        viewModel.isDeleteModalPresented = true
    }
    
    private func handleDelete() {
        Task {
            if await viewModel.handleDelete() {
                router.popToRoot()
            }
        }
    }
}
