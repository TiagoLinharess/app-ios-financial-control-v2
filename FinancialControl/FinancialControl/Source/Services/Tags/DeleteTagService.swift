//
//  TagService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseAuth

protocol DeleteTagServiceProtocol {
    func execute(id: String) async throws
}

final class DeleteTagService: FCService, DeleteTagServiceProtocol {
    
    // MARK: Properties
    
    private let repository: TagRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository: TagRepositoryProtocol = TagRepository(),
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
