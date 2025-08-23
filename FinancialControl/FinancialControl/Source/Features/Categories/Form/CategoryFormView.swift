//
//  CategoryFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryFormView<ViewModel: CategoryFormViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: viewModel.title) {
            VStack(spacing: .medium) {
                ScrollView(.vertical) {
                    VStack(spacing: .medium) {
                        CategoryItemView(icon: viewModel.icon, name: viewModel.name)
                        TransactionTypeSelectorView(selectedTransactionType: $viewModel.transactionType)
                        HStack {
                            IconSelectorButton(
                                icon: viewModel.icon,
                                color: .onBackground(colorScheme: colorScheme),
                                action: viewModel.handlePresentIconSelector
                            )
                            Spacer()
                        }
                        SHTextField(
                            title: Localizable.Commons.name,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            text: $viewModel.name
                        )
                    }
                    .padding(.small)
                }
                Spacer()
                VStack(spacing: .small) {
                    SHButton(
                        title: viewModel.buttonTitle,
                        style: .primary(
                            .brand(colorScheme: colorScheme),
                            .onBrand(colorScheme: colorScheme)
                        ),
                        font: .montserrat,
                        isLoading: viewModel.isFormLoading,
                        isDisabled: viewModel.isDeleteLoading,
                        action: handleSubmit
                    )
                    if viewModel.id != nil {
                        SHButton(
                            title: Localizable.Commons.delete,
                            style: .primary(
                                .error(colorScheme: colorScheme),
                                .onError(colorScheme: colorScheme)
                            ),
                            font: .montserrat,
                            isLoading: viewModel.isDeleteLoading,
                            isDisabled: viewModel.isFormLoading,
                            action: handleDelete
                        )
                    }
                }
                .padding(.small)
            }
        }
        .sheet(isPresented: $viewModel.presentIconSelector) {
            IconSelectorView(selectedIcon: $viewModel.icon, isPresented: $viewModel.presentIconSelector)
        }
        .toastView(toast: $viewModel.toast)
        .onTapGesture(perform: closeKeyboard)
    }
    
    // MARK: Private methods
    
    private func handleSubmit() {
        Task {
            if await viewModel.handleSubmit() {
                router.pop()
            }
        }
    }
    
    private func handleDelete() {
        Task {
            if await viewModel.handleDelete() {
                router.pop()
            }
        }
    }
}
