//
//  DeleteProfileService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseAuth

protocol DeleteProfileServiceProtocol {
    func execute(id: String) async throws
}

final class DeleteProfileService: FCService, DeleteProfileServiceProtocol {
    
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
    
    func execute(id: String) async throws {
        do {
            guard auth.currentUser?.uid != nil else { throw FCError.sessionExpired }
            try await repository.delete(id: id)
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
