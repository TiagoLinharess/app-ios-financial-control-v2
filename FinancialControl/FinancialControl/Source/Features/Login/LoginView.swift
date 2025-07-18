//
//  LoginView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import FirebaseAuth
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct LoginView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var authentication: Authentication
    @EnvironmentObject private var category: Category
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var toast: SHToastViewModel?
    @State private var isLoading: Bool = false
    
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
                    isLoading: isLoading,
                    action: handleClickLogin
                )
            }
            .padding(.small)
        }
        .toastView(toast: $toast)
    }
    
    // MARK: Private methods
    
    func handleClickLogin() {
        Task {
            defer { isLoading = false }
            isLoading = true
            do {
                try await authentication.login()
                await category.read()
            } catch {
                var message: String = error.localizedDescription
                if let fcError = error as? FCError {
                    message = fcError.message
                }
                
                toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            }
        }
    }
}
