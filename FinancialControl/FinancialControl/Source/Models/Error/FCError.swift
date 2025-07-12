//
//  FCError.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import Foundation

enum FCError: Error {
    case generic
    case userPermission
    case userCanceledLogin
    case sessionExpired
    case parseError
    
    init(value: String) {
        switch value {
        case Constants.Error.userCanceledLogin:
            self = .userCanceledLogin
        default:
            self = .generic
        }
    }
    
    var message: String {
        switch self {
        case .userPermission:
            Localizable.Error.userPermission
        case .userCanceledLogin:
            Localizable.Error.userCanceledLogin
        case .generic:
            Localizable.Error.generic
        case .parseError:
            "Ocorreu um erro ao processar os dados. Por favor, tente novamente mais tarde."
        case .sessionExpired:
            "Sua sessão expirou. Por favor, logue-se novamente."
        }
    }
}
