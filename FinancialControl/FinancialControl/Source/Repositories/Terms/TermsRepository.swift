//
//  TermsRepository.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/10/25.
//

import FirebaseFirestore

protocol TermsRepositoryProtocol {
    func read() async throws -> TermsResponseModel
}

final class TermsRepository: TermsRepositoryProtocol {
    
    // MARK: Properties
    
    private let database: Firestore
    
    // MARK: Init
    
    init(database: Firestore = .firestore()) {
        self.database = database
    }
    
    // MARK: Public methods
    
    func read() async throws -> TermsResponseModel {
        let snapshot = try await database.collection(.terms)
            .document(CollectionType.terms.rawValue)
            .getDocument()
        
        guard snapshot.exists else { throw FCError.parseError }
        
        do {
            let terms = try snapshot.data(as: TermsResponseModel.self)
            return terms
        } catch {
            throw FCError.parseError
        }
    }
}
