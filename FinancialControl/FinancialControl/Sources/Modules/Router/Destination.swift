//
//  Destination.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 06/01/25.
//

protocol DestinationProtocol {
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
}

public enum LoginDestination {
    case createAccount
    case login
}
