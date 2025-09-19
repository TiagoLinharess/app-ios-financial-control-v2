//
//  FirstLoginFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct FirstLoginFormView<ViewModel: FirstLoginFormViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject private var router: Router
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView {
            VStack(spacing: .medium) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: .medium) {
                        Text(Localizable.Profile.title)
                            .configureWithSH(
                                color: .onBackground(colorScheme: colorScheme),
                                font: .body(.montserrat, .semiBold)
                            )
                        PronounSelectorView(selectedPronoun: $viewModel.pronoun)
                        SHTextField(
                            title: Localizable.Profile.nickname,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            text: $viewModel.nickname
                        )
                        SHDatePicker(
                            title: Localizable.Profile.birthdate,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            date: $viewModel.birthdate,
                            range: ...Date()
                        )
                    }
                }
                .padding(.small)
                SHButton(
                    title: Localizable.Commons.continueText,
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: viewModel.isLoading,
                    action: handleSubmit
                )
                .padding(.small)
            }
        }
        .toastView(toast: $viewModel.toast)
        .toolbarVisibility(.hidden)
    }
    
    // MARK: Private methods
    
    func handleSubmit() {
        Task {
            if let result = await viewModel.submit() {
                router.push(.firstLoginLoading(step: result))
            }
        }
    }
}
