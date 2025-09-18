//
//  ReadProfileService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseAuth

protocol ReadProfileServiceProtocol {
    func execute() async throws -> ProfileDataModel?
}

final class ReadProfileService: FCService, ReadProfileServiceProtocol {
    
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
    
    func execute() async throws -> ProfileDataModel? {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            let response = try await repository.read(userID: userID)
            return ProfileDataModel(from: response)
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
