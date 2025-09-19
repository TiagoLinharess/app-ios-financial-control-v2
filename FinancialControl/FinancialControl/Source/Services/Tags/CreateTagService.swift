//
//  TagService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseAuth
import SharpnezDesignSystemSwiftUI
import SwiftUI

protocol CreateTagServiceProtocol {
    func executeBasics() async throws
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
    
    func executeBasics() async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            
            let basicTags: [AddTagDataModel] = [
                AddTagDataModel(backgroundColor: .green, textColor: .white, name: Localizable.Tags.Basics.salary),
                AddTagDataModel(backgroundColor: .blue, textColor: .white, name: Localizable.Tags.Basics.streamings),
                AddTagDataModel(backgroundColor: .red, textColor: .white, name: Localizable.Tags.Basics.food),
                AddTagDataModel(backgroundColor: .gray, textColor: .white, name: Localizable.Tags.Basics.gasoline),
            ]
            
            for tag in basicTags {
                try await repository.create(requestModel: tag.toRequestModel(userID: userID))
            }
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
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
