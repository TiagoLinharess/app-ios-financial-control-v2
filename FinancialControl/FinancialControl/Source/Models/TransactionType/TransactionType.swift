//
//  TransactionType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

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
            return Localizable.TransactionType.income
        case .debit:
            return Localizable.TransactionType.debit
        case .credit:
            return Localizable.TransactionType.credit
        }
    }
    
    var listTitle: String {
        switch self {
        case .income:
            return Localizable.TransactionType.incomes
        case .debit:
            return Localizable.TransactionType.debits
        case .credit:
            return Localizable.TransactionType.credits
        }
    }
}
