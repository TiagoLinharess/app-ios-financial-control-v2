//
//  TagService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseAuth

protocol TagServiceProtocol {
    func read() async throws -> [TagViewModel]
    func create(model: AddTagViewModel) async throws
    func update(model: TagViewModel) async throws
    func delete(id: String) async throws
}

final class TagService: FCService, TagServiceProtocol {
    
    // MARK: Properties
    
    private let repository: TagRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository:TagRepositoryProtocol = TagRepository(),
        auth: Auth = .auth(),
    ) {
        self.repository = repository
        self.auth = auth
    }
    
    // MARK: Public methods
    
    func read() async throws -> [TagViewModel] {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            return try await repository.read(userID: userID)
                .compactMap { response -> TagViewModel? in
                    TagViewModel(from: response)
                }
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func create(model: AddTagViewModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func update(model: TagViewModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
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
}
