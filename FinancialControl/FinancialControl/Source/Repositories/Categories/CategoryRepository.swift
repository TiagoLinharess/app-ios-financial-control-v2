//
//  CategoryRepository.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import FirebaseFirestore

protocol CategoryRepositoryProtocol {
    func read(userID: String) async throws -> [CategoryResponseModel]
    func create(requestModel: CategoryRequestModel) async throws
    func update(requestModel: CategoryRequestModel) async throws
    func delete(id: String, userID: String) async throws
}

final class CategoryRepository: CategoryRepositoryProtocol {
    
    // MARK: Properties
    
    private let database: Firestore
    
    // MARK: Init
    
    init(database: Firestore = .firestore()) {
        self.database = database
    }
    
    // MARK: Public methods
    
    func read(userID: String) async throws -> [CategoryResponseModel] {
        let snapshot = try await database.collection("categories")
            .whereField("user_id", isEqualTo: userID)
            .getDocuments()
        
        return snapshot
            .documents
            .compactMap { try? $0.data(as: CategoryResponseModel.self) }
    }
    
    func create(requestModel: CategoryRequestModel) async throws {
        let dict = try JSONEncoder().toDictionary(model: requestModel)
        
        try await database.collection("categories")
            .addDocument(data: dict)
    }
    
    func update(requestModel: CategoryRequestModel) async throws {
        let dict = try JSONEncoder().toDictionary(model: requestModel)
        
        try await database.collection("categories")
            .document(requestModel.id)
            .updateData(dict)
    }
    
    func delete(id: String, userID: String) async throws {
        try await database.collection("categories")
            .document(id)
            .delete()
    }
}
