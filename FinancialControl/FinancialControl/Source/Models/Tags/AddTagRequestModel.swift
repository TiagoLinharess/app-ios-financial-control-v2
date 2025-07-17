//
//  AddTagRequestModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Foundation

public struct AddTagRequestModel: Encodable {
    let userID: String
    let name: String
    let color: String
    let createdAt: Date
    
    nonisolated enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case color
        case createdAt = "created_at"
    }
}
