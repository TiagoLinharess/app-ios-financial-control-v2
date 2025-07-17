//
//  TagViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Foundation

struct TagViewModel: Identifiable, Equatable, Hashable {
    let id: String
    let color: String
    let name: String
    let createdAt: Date
    
    init(id: String, color: String, name: String, createdAt: Date) {
        self.id = id
        self.color = color
        self.name = name
        self.createdAt = createdAt
    }
    
    init?(from response: TagResponseModel) {
        guard let id = response.id else { return nil }
        self.id = id
        self.color = response.color
        self.name = response.name
        self.createdAt = response.createdAt
    }
    
    func toRequestModel(userID: String) -> EditTagRequestModel {
        return EditTagRequestModel(
            id: id,
            userID: userID,
            name: name,
            color: color,
            createdAt: createdAt
        )
    }
}
