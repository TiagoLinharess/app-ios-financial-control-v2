//
//  LoginStep.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

enum LoginStep {
    case newUser
    case existingUser
    
    var destination: Destination {
        switch self {
        case .newUser: .firstLoginForm
        case .existingUser: .home
        }
    }
}
