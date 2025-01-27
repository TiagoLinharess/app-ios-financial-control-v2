//
//  Destination.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 06/01/25.
//

public protocol DestinationProtocol {
    func navigate(to destination: Destination)
}

public enum Destination {
    case home
    case login(LoginDestination)
    case payment
    case paymentType
    case creditCard
    case product
    case budget
    case bill
    
    public var title: String {
        switch self {
        case .home:
            RouterLocalizable.Modules.home
        case .login:
            RouterLocalizable.Modules.login
        case .payment:
            RouterLocalizable.Modules.paymentType
        case .paymentType:
            RouterLocalizable.Modules.paymentType
        case .creditCard:
            RouterLocalizable.Modules.creditCard
        case .product:
            RouterLocalizable.Modules.product
        case .budget:
            RouterLocalizable.Modules.budget
        case .bill:
            RouterLocalizable.Modules.bill
        }
    }

    public var iconName: String {
        switch self {
        case .home:
            RouterConstants.Icons.home
        case .login:
            RouterConstants.Icons.login
        case .payment:
            RouterConstants.Icons.payment
        case .paymentType:
            RouterConstants.Icons.paymentType
        case .creditCard:
            RouterConstants.Icons.creditCard
        case .product:
            RouterConstants.Icons.product
        case .budget:
            RouterConstants.Icons.budget
        case .bill:
            RouterConstants.Icons.bill
        }
    }
}

public enum LoginDestination {
    case createAccount
    case login
}
