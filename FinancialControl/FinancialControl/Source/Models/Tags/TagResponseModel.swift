//
//  TagResponseModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import FirebaseFirestore

struct TagResponseModel: Decodable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let backgroundColor: String
    let textColor: String
    let createdAt: Date
    
    nonisolated enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundColor = "background_color"
        case textColor = "text_color"
        case createdAt = "created_at"
    }
}
