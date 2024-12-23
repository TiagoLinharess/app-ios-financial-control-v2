//
//  CreateAccountView.swift
//  Login
//
//  Created by Tiago Linhares on 22/12/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CreateAccountView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
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
                    text: $email
                )
                SHTextField(
                    title: LoginLocalizable.CreateAccount.password,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $password
                )
                SHTextField(
                    title: LoginLocalizable.CreateAccount.confirmPassword,
                    color: .primarySH,
                    font: .body(.montserrat, .regular),
                    titleFont: .subtitle(.montserrat, .regular),
                    text: $confirmPassword
                )
                Spacer()
                SHButton(
                    title: LoginLocalizable.CreateAccount.title,
                    style: .primary(.primarySH, .onPrimarySH),
                    font: .body(.montserrat, .regular),
                    action: handleCreateAccount
                )
            }
            .padding(.small)
        }
    }
    
    private func handleCreateAccount() {
        print("create account")
    }
}
