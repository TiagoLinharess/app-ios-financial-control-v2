//
//  UpdateProfileService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseAuth

protocol UpdateProfileServiceProtocol {
    func execute(model: ProfileDataModel) async throws
}

final class UpdateProfileService: FCService, UpdateProfileServiceProtocol {
    
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
    
    func execute(model: ProfileDataModel) async throws {
        do {
            guard auth.currentUser?.uid != nil else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.nickname, errorMessage: Localizable.Commons.emptyNickname)
            try await repository.update(requestModel: model.toRequestModel())
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
