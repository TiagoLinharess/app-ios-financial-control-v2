//
//  CategoryService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import FirebaseAuth

protocol CategoryServiceProtocol {
    func read() async throws -> [CategoryDataModel]
    func create(model: AddCategoryDataModel) async throws
    func update(model: CategoryDataModel) async throws
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
    
    func read() async throws -> [CategoryDataModel] {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            return try await repository.read(userID: userID)
                .compactMap { response -> CategoryDataModel? in
                    CategoryDataModel(from: response)
                }
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func create(model: AddCategoryDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateName(name: model.name)
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func update(model: CategoryDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateName(name: model.name)
            try await repository.update(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func delete(id: String) async throws {
        do {
            try await repository.delete(id: id)
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    // MARK: Private methods
    
    private func validateName(name: String) throws {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw FCError.custom(Localizable.Commons.emptyName)
        }
    }
}
