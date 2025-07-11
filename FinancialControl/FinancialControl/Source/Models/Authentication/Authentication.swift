//
//  Authentication.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import Combine
import SwiftUI

@MainActor
final class Authentication: ObservableObject {
    
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
