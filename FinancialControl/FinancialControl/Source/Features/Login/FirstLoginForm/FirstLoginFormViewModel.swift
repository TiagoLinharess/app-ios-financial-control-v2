//
//  FirstLoginFormViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI

protocol FirstLoginFormViewModelProtocol: ObservableObject {
    var nickname: String { get set }
    var pronoun: Pronoun { get set }
    var birthdate: Date { get set }
    
    func submit() -> AddProfileDataModel
}

final class FirstLoginFormViewModel: FirstLoginFormViewModelProtocol {
    
    // MARK: Properties
    
    @Published var nickname: String = ""
    @Published var pronoun: Pronoun = .he
    @Published var birthdate: Date = .now
    
    // MARK: Public methods
    
    func submit() -> AddProfileDataModel {
        return AddProfileDataModel(
            nickname: nickname,
            pronoun: pronoun,
            birthdate: birthdate
        )
    }
}
