//
//  ProfileRepository.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseFirestore

protocol ProfileRepositoryProtocol {
    func read(userID: String) async throws -> ProfileResponseModel?
    func create(requestModel: AddProfileRequestModel) async throws
    func update(requestModel: EditProfileRequestModel) async throws
    func delete(id: String) async throws
}

final class ProfileRepository: ProfileRepositoryProtocol {
    
    // MARK: Properties
    
    private let database: Firestore
    
    // MARK: Init
    
    init(database: Firestore = .firestore()) {
        self.database = database
    }
    
    // MARK: Public methods
    
    func read(userID: String) async throws -> ProfileResponseModel? {
        let snapshot = try await database.collection(.profiles)
            .whereField("user_id", isEqualTo: userID)
            .limit(to: 1)
            .getDocuments()
        
        return snapshot
            .documents
            .compactMap { try? $0.data(as: ProfileResponseModel.self) }
            .first
    }
    
    func create(requestModel: AddProfileRequestModel) async throws {
        try await database.collection(.profiles)
            .addDocument(requestModel)
    }
    
    func update(requestModel: EditProfileRequestModel) async throws {
        try await database.collection(.profiles)
            .updateData(requestModel, reference: requestModel.id)
    }
    
    func delete(id: String) async throws {
        try await database.collection(.profiles)
            .document(id)
            .delete()
    }
    
    
}
