//
//  SignUpView.swift
//  Login
//
//  Created by Tiago Linhares on 22/12/24.
//

import SharpnezCore
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct SignUpView: View {
    
    // MARK: Properties
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: LoginLocalizable.SignUp.title, font: .poppins) {
            VStack(alignment: .center, spacing: .small) {
                SHTextField(
                    title: LoginLocalizable.SignUp.name,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $name
                )
                SHTextField(
                    title: LoginLocalizable.SignUp.email,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $email,
                    rules: [
                        .init(
                            title: LoginLocalizable.SignUp.emailRule,
                            isComplete: email.isValidEmail
                        )
                    ],
                    contentType: .emailAddress,
                    keyboardType: .emailAddress
                )
                SHPasswordField(
                    title: LoginLocalizable.SignUp.password,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $password,
                    rules: [
                        .init(
                            title: LoginLocalizable.SignUp.numberCharactersRule,
                            isComplete: numberCharactersRule()
                        ),
                        .init(
                            title: LoginLocalizable.SignUp.capitalLetterRule,
                            isComplete: password.containsUppercasedLetter
                        ),
                        .init(
                            title: LoginLocalizable.SignUp.lowercaseLetterRule,
                            isComplete: password.containsLowercasedLetter
                        ),
                        .init(
                            title: LoginLocalizable.SignUp.numberRule,
                            isComplete: password.containsNumber
                        ),
                        .init(
                            title: LoginLocalizable.SignUp.specialCharacterRule,
                            isComplete: password.containsSpecialCharacter
                        ),
                    ]
                )
                SHPasswordField(
                    title: LoginLocalizable.SignUp.confirmPassword,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $confirmPassword,
                    rules: [
                        .init(
                            title: LoginLocalizable.SignUp.confirmPasswordRule,
                            isComplete: passwordMustBeEqual()
                        )
                    ]
                )
                SHButton(
                    title: LoginLocalizable.SignUp.title,
                    style: .primary(.primarySH, .onPrimarySH),
                    font: .body(.montserrat, .regular),
                    isDisabled: handleIsButtonDisabled(),
                    action: handleSignUp
                )
            }
            .padding(.small)
        }
    }
    
    // MARK: Private Methods
    
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
    
    private func handleSignUp() {
        print("Sign up")
    }
}
