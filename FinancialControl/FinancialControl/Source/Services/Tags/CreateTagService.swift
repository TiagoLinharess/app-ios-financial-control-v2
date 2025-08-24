//
//  TagService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseAuth

protocol CreateTagServiceProtocol {
    func execute(model: AddTagDataModel) async throws
}

final class CreateTagService: FCService, CreateTagServiceProtocol {
    
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
    
    func execute(model: AddTagDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.name, errorMessage: Localizable.Commons.emptyName)
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
