//
//  TagFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagFormView<ViewModel: TagFormViewModelProtocol>: View {
    
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
                        TagItemView(
                            name: viewModel.name,
                            backgroundColor: viewModel.backgroundColor,
                            textColor: viewModel.textColor
                        )
                        SHTextField(
                            title: Localizable.Commons.name,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            text: $viewModel.name
                        )
                        ColorPicker(selection: $viewModel.backgroundColor) {
                            Text(Localizable.Commons.selectBackgroundColor)
                                .configureWithSH(
                                    color: .onBackground(colorScheme: colorScheme),
                                    font: .body(.montserrat, .medium)
                                )
                        }
                        ColorPicker(selection: $viewModel.textColor) {
                            Text(Localizable.Commons.selectTextColor)
                                .configureWithSH(
                                    color: .onBackground(colorScheme: colorScheme),
                                    font: .body(.montserrat, .medium)
                                )
                        }
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
                            action: viewModel.handleTapDelete
                        )
                    }
                }
                .padding(.small)
            }
        }
        .toastView(toast: $viewModel.toast)
        .onTapGesture(perform: closeKeyboard)
        .alert(isPresented: $viewModel.deleteAlertPresented) {
            Alert(
                title: Text(Localizable.Tags.deleteTitle),
                message: Text(Localizable.Tags.deleteDescription),
                primaryButton: .destructive(
                    Text(Localizable.Commons.delete),
                    action: handleDelete
                ),
                secondaryButton: .default(Text(Localizable.Commons.goBack))
            )
        }
    }
    
    // MARK: Private methods
    
    private func handleSubmit() {
        Task {
            if await viewModel.submit() {
                router.pop()
            }
        }
    }
    
    private func handleDelete() {
        Task {
            if await viewModel.delete() {
                router.pop()
            }
        }
    }
}
