//
//  UpdateCategoryService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import FirebaseAuth

protocol UpdateCategoryServiceProtocol {
    func update(model: CategoryDataModel) async throws
}

final class UpdateCategoryService: FCService, UpdateCategoryServiceProtocol {
    
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
    
    func update(model: CategoryDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.name, errorMessage: Localizable.Commons.emptyName)
            try await repository.update(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
