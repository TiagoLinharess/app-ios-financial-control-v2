//
//  ProfileResponseModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import FirebaseFirestore

struct ProfileResponseModel: Codable {
    @DocumentID var id: String?
    let userID: String
    let nickname: String
    let pronounID: Int
    let birthdate: Date
    let createdAt: Date
    
    nonisolated enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case nickname
        case pronounID = "pronoun_id"
        case birthdate
        case createdAt = "created_at"
    }
}
