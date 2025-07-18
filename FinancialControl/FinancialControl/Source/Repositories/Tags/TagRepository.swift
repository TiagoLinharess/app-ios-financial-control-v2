//
//  TagRepository.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseFirestore

protocol TagRepositoryProtocol {
    func read(userID: String) async throws -> [TagResponseModel]
    func create(requestModel: AddTagRequestModel) async throws
    func update(requestModel: EditTagRequestModel) async throws
    func delete(id: String) async throws
}

final class TagRepository: TagRepositoryProtocol {
    
    // MARK: Properties
    
    private let database: Firestore
    
    // MARK: Init
    
    init(database: Firestore = .firestore()) {
        self.database = database
    }
    
    // MARK: Public methods
    
    func read(userID: String) async throws -> [TagResponseModel] {
        let snapshot = try await database.collection(.tags)
            .whereField("user_id", isEqualTo: userID)
            .getDocuments()
        
        return snapshot
            .documents
            .compactMap { try? $0.data(as: TagResponseModel.self) }
    }
    
    func create(requestModel: AddTagRequestModel) async throws {
        try await database.collection(.tags)
            .addDocument(requestModel)
    }
    
    func update(requestModel: EditTagRequestModel) async throws {
        try await database.collection(.tags)
            .updateData(requestModel, reference: requestModel.id)
    }
    
    func delete(id: String) async throws {
        try await database.collection(.tags)
            .document(id)
            .delete()
    }
}
