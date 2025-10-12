//
//  UpdateProfileFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 03/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct UpdateProfileFormView<ViewModel: UpdateProfileFormViewModelProtocol>: View {
    
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
        SHContainerView(title: Localizable.ProfileSettings.editProfile) {
            switch viewModel.viewState {
            case .success:
                ProfileFormView(
                    buttonTitle: Localizable.Commons.update,
                    pronoun: $viewModel.pronoun,
                    nickname: $viewModel.nickname,
                    birthdate: $viewModel.birthdate,
                    isLoading: viewModel.isUpdateLoading,
                    onSubmit: handleSubmit
                )
            case .failure(let message):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Commons.ops,
                    description: message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: loadProfile
                )
            case .loading:
                SHLoading(style: .large, color: .onBackground(colorScheme: colorScheme))
            }
        }
        .onAppear(perform: loadProfile)
        .toastView(toast: $viewModel.toast)
    }
    
    // MARK: Private methods
    
    func loadProfile() {
        Task {
            await viewModel.read()
        }
    }
    
    func handleSubmit() {
        Task {
            if await viewModel.submit() {
                router.pop()
            }
        }
    }
}
