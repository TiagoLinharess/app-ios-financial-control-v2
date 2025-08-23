//
//  DeleteCategoryService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import FirebaseAuth

protocol DeleteCategoryServiceProtocol {
    func delete(id: String) async throws
}

final class DeleteCategoryService: FCService, DeleteCategoryServiceProtocol {
    
    // MARK: Properties
    
    private let repository: CategoryRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository: CategoryRepositoryProtocol = CategoryRepository(),
        auth: Auth = .auth(),
    ) {
        self.repository = repository
        self.auth = auth
    }
    
    // MARK: Public methods
    
    func delete(id: String) async throws {
        do {
            try await repository.delete(id: id)
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
