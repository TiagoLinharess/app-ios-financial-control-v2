//
//  AddCategoryViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import Foundation

struct AddCategoryViewModel {
    let transactionType: TransactionType
    let name: String
    let createdAt: Date
    
    init(transactionType: TransactionType, name: String) {
        self.transactionType = transactionType
        self.name = name
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddCategoryRequestModel {
        return AddCategoryRequestModel(
            transactionTypeID: transactionType.rawValue,
            userID: userID,
            name: name,
            createdAt: createdAt
        )
    }
}
