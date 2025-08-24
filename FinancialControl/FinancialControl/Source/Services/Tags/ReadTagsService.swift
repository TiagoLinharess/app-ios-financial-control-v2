//
//  ReadTagsService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

import FirebaseAuth

protocol ReadTagsServiceProtocol {
    func execute() async throws -> [TagDataModel]
}

final class ReadTagsService: FCService, ReadTagsServiceProtocol {
    
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
    
    func execute() async throws -> [TagDataModel] {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            return try await repository.read(userID: userID)
                .compactMap { response -> TagDataModel? in
                    TagDataModel(from: response)
                }
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
