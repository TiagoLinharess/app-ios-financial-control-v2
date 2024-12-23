//
//  HomeSample.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//

import Login
import Core
import CoreSample
import Router
import SwiftUI

struct HomeSample<Facade: LoginFacadeProtocol>: View {
    @State private var loginFacade: Facade
    @EnvironmentObject var router: Router
    
    init(loginFacade: Facade) {
        self.loginFacade = loginFacade
    }
    
    var body: some View {
        Button("Navigate to login", action: navigateToLogin)
        Button("Navigate to create account", action: navigateToCreateAccount)
    }
    
    private func navigateToLogin() {
        loginFacade.start(destination: .login, completion: onFinish)
        router.navigate(to: Destination<Facade>.login(loginFacade))
    }
    
    private func navigateToCreateAccount() {
        loginFacade.start(destination: .createAccount, completion: onFinish)
        router.navigate(to: Destination<Facade>.login(loginFacade))
    }
    
    private func onFinish() {
        print("Finish")
    }
}
