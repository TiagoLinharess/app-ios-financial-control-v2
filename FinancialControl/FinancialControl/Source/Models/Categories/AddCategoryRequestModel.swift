//
//  AddCategoryRequestModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import Foundation

struct AddCategoryRequestModel: Encodable {
    let transactionTypeID: Int
    let userID: String
    let name: String
    let createdAt: Date
    
    nonisolated enum CodingKeys: String, CodingKey {
        case transactionTypeID = "transaction_type_id"
        case userID = "user_id"
        case name
        case createdAt = "created_at"
    }
}
