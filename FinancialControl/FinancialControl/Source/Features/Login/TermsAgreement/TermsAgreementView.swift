//
//  TermsAgreementView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 07/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI
import WebKit

struct TermsAgreementView<ViewModel: TermsAgreementViewModelProtocol>: View {
    
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
        SHContainerView(title: Localizable.Modules.terms) {
            switch viewModel.viewStatus {
            case .loading:
                SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
            case .success(let url):
                TermsAgreementContentView(url: url, action: contentViewAction)
            case .error(let message):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Commons.ops,
                    description: message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: loadTerms
                )
            }
        }
        .onAppear(perform: loadTerms)
        .toastView(toast: $viewModel.toast)
    }
    
    // MARK: Private methods
    
    private func loadTerms() {
        Task {
            await viewModel.readTerms()
        }
    }
    
    private func contentViewAction(action: TermsAgreementAction) {
        if action == .dontAgree {
            logout()
            return
        }
        
        router.push(.firstLoginLoading(profileModel: viewModel.profileModel))
    }
    
    private func logout() {
        Task {
            await viewModel.handleLogout()
            router.popToRoot()
        }
    }
}
