//
//  LoginView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
    
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
            VStack {
                Spacer()
                    .frame(height: .superGiant)
                Image(Constants.Images.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .xxGiant, height: .xxGiant)
                Text(Localizable.Commons.title)
                    .configureWithSH(
                        color: .onBackground(colorScheme: colorScheme),
                        font: .title3(.montserrat, .bold)
                    )
                Spacer()
                    .frame(height: .superGiant)
                Text(Localizable.Login.description)
                    .configureWithSH(
                        color: .onBackground(colorScheme: colorScheme),
                        font: .body(.montserrat, .semiBold)
                    )
                Spacer()
                SHButton(
                    title: Localizable.Login.button,
                    icon: .google,
                    iconRenderingMode: .original,
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: viewModel.isLoading,
                    action: handleClickLogin
                )
            }
            .padding(.small)
        }
        .toastView(toast: $viewModel.toast)
    }
    
    // MARK: Private methods
    
    func handleClickLogin() {
        Task {
            guard let step = await viewModel.login() else { return }
            handleDidLogin(step: step)
        }
    }
    
    private func handleDidLogin(step: LoginStep) {
        router.push(step.destination)
    }
}
