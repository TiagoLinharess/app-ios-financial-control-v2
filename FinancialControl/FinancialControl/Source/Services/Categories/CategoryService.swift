//
//  CategoryService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import FirebaseAuth

protocol CategoryServiceProtocol {
    func read() async throws -> [CategoryViewModel]
    func create(model: AddCategoryViewModel) async throws
    func update(model: CategoryViewModel) async throws
    func delete(id: String) async throws
}

final class CategoryService: FCService, CategoryServiceProtocol {
    
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
    
    func read() async throws -> [CategoryViewModel] {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            return try await repository.read(userID: userID)
                .compactMap { response -> CategoryViewModel? in
                    CategoryViewModel(from: response)
                }
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func create(model: AddCategoryViewModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func update(model: CategoryViewModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try await repository.update(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func delete(id: String) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try await repository.delete(id: id, userID: userID)
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
