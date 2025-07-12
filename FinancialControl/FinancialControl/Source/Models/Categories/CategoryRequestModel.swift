//
//  CategoryRequestModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import Foundation

struct CategoryRequestModel: Encodable, Identifiable {
    let id: String
    let transactionTypeID: Int
    let userID: String
    let name: String
    let createdAt: String
    
    nonisolated enum CodingKeys: String, CodingKey {
        case id
        case transactionTypeID = "transaction_type_id"
        case userID = "user_id"
        case name
        case createdAt = "created_at"
    }
}
