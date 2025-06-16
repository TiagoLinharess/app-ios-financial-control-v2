//
//  AddRoute.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 16/06/25.
//

enum AddRoute: CaseIterable, Identifiable {
    case addPayment
    case addMonthlyPayment
    case addAnnualPayment
    case addPurchaseInstallment
    case addProduct
    case addSubPaymentType
    case addBudget
    case addCreditCard
    
    var id: Int {
        switch self {
        case .addPayment: 0
        case .addMonthlyPayment: 1
        case .addAnnualPayment: 2
        case .addPurchaseInstallment: 3
        case .addProduct: 4
        case .addSubPaymentType: 5
        case .addBudget: 6
        case .addCreditCard: 7
        }
    }
    
    var destination: Destination {
        switch self {
        case .addPayment: .addPayment
        case .addMonthlyPayment: .addMonthlyPayment
        case .addAnnualPayment: .addAnnualPayment
        case .addPurchaseInstallment: .addPurchaseInstallment
        case .addProduct: .addProduct
        case .addSubPaymentType: .addSubPaymentType
        case .addBudget: .addBudget
        case .addCreditCard: .addCreditCard
        }
    }
    
    var title: String {
        switch self {
        case .addPayment: Localizable.AddRoute.payment
        case .addMonthlyPayment: Localizable.AddRoute.monthlyPayment
        case .addAnnualPayment: Localizable.AddRoute.annualPayment
        case .addPurchaseInstallment: Localizable.AddRoute.purchaseInstallment
        case .addProduct: Localizable.AddRoute.product
        case .addSubPaymentType: Localizable.AddRoute.subPaymentType
        case .addBudget: Localizable.Modules.budgets
        case .addCreditCard: Localizable.AddRoute.creditcard
        }
    }
}
