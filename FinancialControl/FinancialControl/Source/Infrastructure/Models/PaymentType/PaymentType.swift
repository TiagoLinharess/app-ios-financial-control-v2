//
//  PaymentType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

enum PaymentType: String, CaseIterable, Codable {
    case income
    case outcome
    case credit
    
    var isIncome: Bool {
        self == .income
    }
}
