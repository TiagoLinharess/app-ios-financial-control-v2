//
//  FirstLoginStep.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

enum FirstLoginStep {
    case created
    case alreadyExists
    
    var loadingMessage: String {
        switch self {
        case .created:
            return Localizable.Profile.finishing
        case .alreadyExists:
            return Localizable.Profile.alreadyCreated
        }
    }
}
