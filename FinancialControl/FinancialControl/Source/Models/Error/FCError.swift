//
//  FCError.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import Foundation

@MainActor
enum FCError: Error {
    case generic
    case userPermission
    case userCanceledLogin
    case sessionExpired
    case parseError
    case custom(String)
    
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
            Localizable.Error.parseError
        case .sessionExpired:
            Localizable.Error.sessionExpired
        case .custom(let message):
            message
        }
    }
}
