//
//  ProfileView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 20/09/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ProfileView<ViewModel: ProfileViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: Localizable.Modules.profile) {
            switch viewModel.viewState {
            case .loading:
                SHLoading(style: .large, color: .onBackground(colorScheme: colorScheme))
            case .success(let model):
                ProfileContentView(model: model, reloadAction: loadProfile)
            case .failure(let message):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Commons.ops,
                    description: message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: loadProfile
                )
            }
        }
        .onAppear(perform: loadProfile)
    }
    
    // MARK: Properties
    
    private func loadProfile() {
        Task {
            await viewModel.loadProfile()
        }
    }
}
