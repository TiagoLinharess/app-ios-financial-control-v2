//
//  TransactionType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI

enum TransactionType: Int, CaseIterable {
    case income = 0
    case debit = 1
    case credit = 2
    
    var isIncome: Bool {
        self == .income
    }
    
    var title: String {
        switch self {
        case .income:
            Localizable.TransactionType.income
        case .debit:
            Localizable.TransactionType.debit
        case .credit:
            Localizable.TransactionType.credit
        }
    }
    
    var listTitle: String {
        switch self {
        case .income:
            Localizable.TransactionType.incomes
        case .debit:
            Localizable.TransactionType.debits
        case .credit:
            Localizable.TransactionType.credits
        }
    }
    
    var icon: SHIconType {
        switch self {
        case .income:
            .wallet
        case .debit:
            .coin
        case .credit:
            .cardPos
        }
    }
}
