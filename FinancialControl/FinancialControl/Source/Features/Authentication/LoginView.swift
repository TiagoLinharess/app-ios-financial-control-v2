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
    
    @StateObject private var login: Login = Login()
    @State private var userLoggedIn = (Auth.auth().currentUser != nil)
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Body
    
    var body: some View {
        SHContainerView {
            if userLoggedIn {
                SHButton(
                    title: "Sair",
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: login.isLoading,
                    action: handleClickLogout
                )
            } else {
                SHButton(
                    title: "Entrar com a sua conta Google",
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: login.isLoading,
                    action: handleClickLogin
                )
            }
        }.onAppear {
            _ = Auth.auth().addStateDidChangeListener { auth, user in
                if (user != nil) {
                    userLoggedIn = true
                } else {
                    userLoggedIn = false
                }
            }
        }
    }
    
    // MARK: Private methods
    
    func handleClickLogin() {
        Task(operation: login.perform)
    }
    
    func handleClickLogout() {
        Task(operation: login.logout)
    }
}
