//
//  CategoryRepository.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import FirebaseFirestore

protocol CategoryRepositoryProtocol {
    func read(userID: String) async throws -> [CategoryResponseModel]
    func create(requestModel: AddCategoryRequestModel) async throws
    func update(requestModel: EditCategoryRequestModel) async throws
    func delete(id: String) async throws
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
        let snapshot = try await database.collection(.categories)
            .whereField("user_id", isEqualTo: userID)
            .order(by: "created_at")
            .getDocuments()
        
        return snapshot
            .documents
            .compactMap { try? $0.data(as: CategoryResponseModel.self) }
    }
    
    func create(requestModel: AddCategoryRequestModel) async throws {
        try await database.collection(.categories)
            .addDocument(requestModel)
    }
    
    func update(requestModel: EditCategoryRequestModel) async throws {
        try await database.collection(.categories)
            .updateData(requestModel, reference: requestModel.id)
    }
    
    func delete(id: String) async throws {
        try await database.collection(.categories)
            .document(id)
            .delete()
    }
}
