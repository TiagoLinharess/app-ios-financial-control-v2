//
//  SessionSingleton.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 12/07/25.
//

import Combine

protocol SessionSingletonProtocol {
    func getAuthentication() -> Authentication?
    func setAuthentication(_ authentication: Authentication?)
    func remakeSession() async throws
}

final class SessionSingleton: SessionSingletonProtocol {
    
    // MARK: Singleton
    
    static var shared: SessionSingleton = SessionSingleton()
    
    // MARK: Properties
    
    private var authentication: Authentication?
    
    // MARK: Get
    
    func getAuthentication() -> Authentication? {
        authentication
    }
    
    // MARK: Set
    
    func setAuthentication(_ authentication: Authentication?) {
        self.authentication = authentication
    }
    
    // MARK: Public methods
    
    func remakeSession() async throws {
        try await authentication?.logout()
    }
}
