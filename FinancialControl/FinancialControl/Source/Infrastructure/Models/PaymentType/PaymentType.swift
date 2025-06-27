//
//  PaymentType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

enum PaymentType: String, CaseIterable, Codable, Identifiable {
    case income
    case outcome
    case credit
    
    var id: Int {
        switch self {
        case .income: 0
        case .outcome: 1
        case .credit: 2
        }
    }
    
    var isIncome: Bool {
        self == .income
    }
    
    var title: String {
        switch self {
        case .income: Localizable.PaymentType.income
        case .outcome: Localizable.PaymentType.outcome
        case .credit: Localizable.PaymentType.credit
        }
    }
}
