//
//  AddTagViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Foundation

struct AddTagViewModel {
    let color: String
    let name: String
    let createdAt: Date
    
    init(color: String, name: String) {
        self.color = color
        self.name = name
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddTagRequestModel {
        return AddTagRequestModel(
            userID: userID,
            name: name,
            color: color,
            createdAt: createdAt
        )
    }
}
