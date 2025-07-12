//
//  TransactionType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

enum TransactionType: Int {
    case income = 0
    case debit = 1
    case credit = 2
    
    var isIncome: Bool {
        self == .income
    }
}
