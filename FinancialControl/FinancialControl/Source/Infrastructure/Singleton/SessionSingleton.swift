//
//  SessionSingleton.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 12/07/25.
//

import Combine

protocol SessionSingletonProtocol {
    func getAuthentication() -> AuthenticationManager?
    func setAuthentication(_ authentication: AuthenticationManager?)
    func remakeSession() async throws
}

final class SessionSingleton: SessionSingletonProtocol {
    
    // MARK: Singleton
    
    static var shared: SessionSingleton = SessionSingleton()
    
    // MARK: Properties
    
    private var authentication: AuthenticationManager?
    
    // MARK: Get
    
    func getAuthentication() -> AuthenticationManager? {
        authentication
    }
    
    // MARK: Set
    
    func setAuthentication(_ authentication: AuthenticationManager?) {
        self.authentication = authentication
    }
    
    // MARK: Public methods
    
    func remakeSession() async throws {
        try await authentication?.logout()
    }
}
