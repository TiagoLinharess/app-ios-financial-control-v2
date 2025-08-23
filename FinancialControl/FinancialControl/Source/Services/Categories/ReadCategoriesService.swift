//
//  ReadCategoriesService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import FirebaseAuth

protocol ReadCategoriesServiceProtocol {
    func read() async throws -> [CategoryDataModel]
}

final class ReadCategoriesService: FCService, ReadCategoriesServiceProtocol {
    
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
}
