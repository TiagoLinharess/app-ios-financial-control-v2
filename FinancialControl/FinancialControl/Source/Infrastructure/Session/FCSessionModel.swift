//
//  FCSessionModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine

protocol FCSessionModelProtocol {
    var user: UserModel? { get }
    var delegate: RouterDelegate? { get set }
    func remakeSession() async throws
    func validateSession() -> Bool
    func logout() async throws
    func login() async throws
}

@MainActor
final class FCSessionModel: FCSessionModelProtocol {
    
    // MARK: Properties
    
    private let service: AuthenticationServiceProtocol
    private(set) var user: UserModel?
    var delegate: (any RouterDelegate)?
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func remakeSession() async throws {
        try await logout()
        delegate?.remakeSession()
    }
    
    func validateSession() -> Bool {
        user = service.validateSession()
        return user != nil
    }
    
    func logout() async throws {
        try await service.logout()
        user = nil
    }
    
    func login() async throws {
        self.user = try await service.login()
    }
}
