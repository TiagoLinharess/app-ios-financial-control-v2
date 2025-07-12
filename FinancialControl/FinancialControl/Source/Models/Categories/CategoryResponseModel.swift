//
//  CategoryResponseModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import FirebaseFirestore

struct CategoryResponseModel: Decodable, Identifiable {
    @DocumentID var id: String?
    let transactionTypeID: Int
    let name: String
    let createdAt: String
    
    nonisolated enum CodingKeys: String, CodingKey {
        case id
        case transactionTypeID = "transaction_type_id"
        case name
        case createdAt = "created_at"
    }
}
