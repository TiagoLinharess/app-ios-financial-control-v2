//
//  VerifyProfileService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 20/09/25.
//

import FirebaseAuth

protocol VerifyProfileServiceProtocol {
    func execute() async throws -> Bool
}

final class VerifyProfileService: FCService, VerifyProfileServiceProtocol {
    
    // MARK: Properties
    
    private let repository: ProfileRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository: ProfileRepositoryProtocol = ProfileRepository(),
        auth: Auth = .auth(),
    ) {
        self.repository = repository
        self.auth = auth
    }
    
    // MARK: Public methods
    
    func execute() async throws -> Bool {
        do {
            guard let user = auth.currentUser else { throw FCError.sessionExpired }
            return try await repository.read(userID: user.uid) != nil
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
