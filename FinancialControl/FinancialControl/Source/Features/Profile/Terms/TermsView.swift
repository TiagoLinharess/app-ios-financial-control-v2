//
//  TermsView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 03/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI
import WebKit

struct TermsView<ViewModel: TermsViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
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
                TermsContentView(url: url)
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
    }
    
    // MARK: Private methods
    
    private func loadTerms() {
        Task {
            await viewModel.readTerms()
        }
    }
}
