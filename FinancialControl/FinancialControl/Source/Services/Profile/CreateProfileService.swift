//
//  CreateProfileService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseAuth

protocol CreateProfileServiceProtocol {
    func execute(model: AddProfileDataModel) async throws
}

final class CreateProfileService: FCService, CreateProfileServiceProtocol {
    
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
    
    func execute(model: AddProfileDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.nickname, errorMessage: Localizable.Commons.emptyNickname)
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
