//
//  CategoryViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import Foundation

struct CategoryViewModel: Identifiable, Equatable, Hashable {
    let id: String
    let transactionType: TransactionType
    let icon: SHIconType
    let name: String
    let createdAt: Date
    
    init(id: String, transactionType: TransactionType, icon: SHIconType, name: String, createdAt: Date) {
        self.id = id
        self.transactionType = transactionType
        self.icon = icon
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
        self.icon = SHIconType(rawValue: response.icon) ?? .info
        self.name = response.name
        self.createdAt = response.createdAt
    }
    
    func toRequestModel(userID: String) -> EditCategoryRequestModel {
        return EditCategoryRequestModel(
            id: id,
            transactionTypeID: transactionType.rawValue,
            userID: userID,
            name: name,
            icon: icon.rawValue,
            createdAt: createdAt
        )
    }
}
