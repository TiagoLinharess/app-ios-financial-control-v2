//
//  FirstLoginLoading.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct FirstLoginLoading<ViewModel: FirstLoginLoadingViewModelProtocol>: View {
    
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
        Group {
            switch viewModel.viewState {
            case .loading:
                SHLoadingView(
                    color: .background(colorScheme: colorScheme),
                    onColor: .onBackground(colorScheme: colorScheme),
                    firstText: viewModel.title,
                    font: .body(.poppins, .regular)
                )
            case .failure(let message):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Commons.ops,
                    description: message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    secondaryButtonTitle: Localizable.Commons.backToBeginning,
                    primaryAction: submit,
                    secondaryAction: backToBeginning
                )
            }
        }
        .onAppear(perform: submit)
        .toolbarVisibility(.hidden)
    }
    
    // MARK: Private methods
    
    private func submit() {
        Task {
            if await viewModel.execute() {
                if router.path.count > 1 {
                    router.pop(count: 2)
                } else {
                    router.push(.home)
                }
            }
        }
    }
    
    private func backToBeginning() {
        Task {
            if await viewModel.logout() {
                router.popToRoot()
            }
        }
    }
}
