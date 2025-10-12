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
            ProfileFormView(
                subtitle: Localizable.Profile.title,
                buttonTitle: Localizable.Commons.continueText,
                pronoun: $viewModel.pronoun,
                nickname: $viewModel.nickname,
                birthdate: $viewModel.birthdate,
                isLoading: false,
                onSubmit: handleSubmit
            )
        }
        .toolbarVisibility(.hidden)
    }
    
    // MARK: Private methods
    
    func handleSubmit() {
        let model = viewModel.submit()
        router.push(.termsAgreement(profileModel: model))
    }
}
