//
//  TagService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseAuth

protocol UpdateTagServiceProtocol {
    func execute(model: TagDataModel) async throws
}

final class UpdateTagService: FCService, UpdateTagServiceProtocol {
    
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
    
    func execute(model: TagDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.name, errorMessage: Localizable.Commons.emptyName)
            try await repository.update(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
