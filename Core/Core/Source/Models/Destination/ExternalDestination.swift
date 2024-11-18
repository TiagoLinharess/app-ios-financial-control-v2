//
//  ExternalDestination.swift
//  Core
//
//  Created by Tiago Linhares on 18/11/24.
//

public enum ExternalDestination: String {
    case home
    case singleForm
    case paymentType
    case creditCard
    case products
    case budgets
    case bills

    public var title: String {
        switch self {
        case .home:
            CoreLocalizable.Modules.home
        case .singleForm:
            CoreLocalizable.Modules.singleForm
        case .paymentType:
            CoreLocalizable.Modules.paymentType
        case .creditCard:
            CoreLocalizable.Modules.creditCard
        case .products:
            CoreLocalizable.Modules.products
        case .budgets:
            CoreLocalizable.Modules.budgets
        case .bills:
            CoreLocalizable.Modules.bills
        }
    }

    public var iconName: String {
        switch self {
        case .home:
            Constants.Icons.home
        case .singleForm:
            Constants.Icons.singleForm
        case .paymentType:
            Constants.Icons.paymentType
        case .creditCard:
            Constants.Icons.creditCard
        case .products:
            Constants.Icons.products
        case .budgets:
            Constants.Icons.budgets
        case .bills:
            Constants.Icons.bills
        }
    }
}
