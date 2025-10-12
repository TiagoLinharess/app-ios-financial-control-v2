//
//  Pronoun.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

enum Pronoun: Int, CaseIterable {
    case he = 0
    case she = 1
    case they = 2
    
    var name: String {
        switch self {
        case .he: return Localizable.Commons.he
        case .she: return Localizable.Commons.she
        case .they: return Localizable.Commons.they
        }
    }
}
