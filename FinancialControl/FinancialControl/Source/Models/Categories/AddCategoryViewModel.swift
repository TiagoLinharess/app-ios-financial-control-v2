//
//  AddCategoryViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import Foundation

struct AddCategoryViewModel {
    let transactionType: TransactionType
    let icon: SHIconType
    let name: String
    let createdAt: Date
    
    init(transactionType: TransactionType, icon: SHIconType, name: String) {
        self.transactionType = transactionType
        self.icon = icon
        self.name = name
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddCategoryRequestModel {
        return AddCategoryRequestModel(
            transactionTypeID: transactionType.rawValue,
            userID: userID,
            name: name,
            icon: icon.rawValue,
            createdAt: createdAt
        )
    }
}
