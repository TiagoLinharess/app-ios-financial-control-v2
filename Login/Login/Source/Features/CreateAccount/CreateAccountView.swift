//
//  CreateAccountView.swift
//  Login
//
//  Created by Tiago Linhares on 22/12/24.
//

import SharpnezCore
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CreateAccountView: View {
    // MARK: - Properties -
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    // MARK: - Body -
    
    var body: some View {
        SHContainerView(title: LoginLocalizable.CreateAccount.title, font: .poppins) {
            VStack(alignment: .center, spacing: .small) {
                SHTextField(
                    title: LoginLocalizable.CreateAccount.name,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $name
                )
                SHTextField(
                    title: LoginLocalizable.CreateAccount.email,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $email,
                    rules: [
                        .init(
                            title: LoginLocalizable.CreateAccount.emailRule,
                            isComplete: email.isValidEmail
                        )
                    ],
                    contentType: .emailAddress,
                    keyboardType: .emailAddress
                )
                SHPasswordField(
                    title: LoginLocalizable.CreateAccount.password,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $password,
                    rules: [
                        .init(
                            title: LoginLocalizable.CreateAccount.numberCharactersRule,
                            isComplete: numberCharactersRule()
                        ),
                        .init(
                            title: LoginLocalizable.CreateAccount.capitalLetterRule,
                            isComplete: password.containsUppercasedLetter
                        ),
                        .init(
                            title: LoginLocalizable.CreateAccount.lowercaseLetterRule,
                            isComplete: password.containsLowercasedLetter
                        ),
                        .init(
                            title: LoginLocalizable.CreateAccount.numberRule,
                            isComplete: password.containsNumber
                        ),
                        .init(
                            title: LoginLocalizable.CreateAccount.specialCharacterRule,
                            isComplete: password.containsSpecialCharacter
                        ),
                    ]
                )
                SHPasswordField(
                    title: LoginLocalizable.CreateAccount.confirmPassword,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $confirmPassword,
                    rules: [
                        .init(
                            title: LoginLocalizable.CreateAccount.confirmPasswordRule,
                            isComplete: passwordMustBeEqual()
                        )
                    ]
                )
                SHButton(
                    title: LoginLocalizable.CreateAccount.title,
                    style: .primary(.primarySH, .onPrimarySH),
                    font: .body(.montserrat, .regular),
                    isDisabled: handleIsButtonDisabled(),
                    action: handleCreateAccount
                )
            }
            .padding(.small)
        }
    }
    
    // MARK: - Private Methods -
    
    private func numberCharactersRule() -> Bool {
        return password.count >= 8
    }
    
    private func passwordMustBeEqual() -> Bool {
        password == confirmPassword && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    private func handlePasswordValidation() -> Bool {
        passwordMustBeEqual() &&
        numberCharactersRule() &&
        password.containsNumber &&
        password.containsUppercasedLetter &&
        password.containsLowercasedLetter &&
        password.containsSpecialCharacter
    }
    
    private func handleIsButtonDisabled() -> Bool {
        email.isEmpty ||
        name.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        !handlePasswordValidation()
    }
    
    private func handleCreateAccount() {
        print("create account")
    }
}
