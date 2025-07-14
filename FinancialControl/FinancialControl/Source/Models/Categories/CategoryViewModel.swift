//
//  CategoryViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import Foundation

struct CategoryViewModel: Identifiable, Equatable {
    let id: String
    let transactionType: TransactionType
    let name: String
    let createdAt: Date
    
    init(id: String, transactionType: TransactionType, name: String, createdAt: Date) {
        self.id = id
        self.transactionType = transactionType
        self.name = name
        self.createdAt = createdAt
    }
    
    init?(from response: CategoryResponseModel) {
        guard let id = response.id,
              let transactionType = TransactionType(rawValue: response.transactionTypeID)
        else {
            return nil
        }
        self.id = id
        self.transactionType = transactionType
        self.name = response.name
        self.createdAt = response.createdAt
    }
    
    func toRequestModel(userID: String) -> EditCategoryRequestModel {
        return EditCategoryRequestModel(
            id: id,
            transactionTypeID: transactionType.rawValue,
            userID: userID,
            name: name,
            createdAt: createdAt
        )
    }
}
