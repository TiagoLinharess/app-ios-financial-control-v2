//
//  AuthenticationManager.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import Combine

@MainActor
final class AuthenticationManager: ObservableObject {
    
    // MARK: Properties
    
    @Published var presentLogin: Bool = false
    @Published var user: UserModel?
    private let service: AuthenticationServiceProtocol
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func login() async throws {
        user = try await service.login()
        presentLogin = false
        // TODO: Implementar criação de categorias e tags no primeiro login
    }
    
    func logout() async throws {
        try await service.logout()
        user = nil
        presentLogin = true
    }
    
    func validateSession() {
        if let user = service.validateSession() {
            self.user = user
            presentLogin = false
        } else {
            presentLogin = true
        }
    }
}
