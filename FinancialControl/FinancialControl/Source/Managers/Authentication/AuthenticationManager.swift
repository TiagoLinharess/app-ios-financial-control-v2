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
    
    @Published var user: UserModel?
    private let service: AuthenticationServiceProtocol
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func logout() async throws {
        try await service.logout()
        user = nil
    }
}
