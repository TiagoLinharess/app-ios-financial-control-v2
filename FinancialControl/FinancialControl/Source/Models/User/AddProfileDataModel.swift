//
//  AddProfileDataModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import Foundation

struct AddProfileDataModel {
    let nickname: String
    let pronoun: Pronoun
    let birthdate: Date
    let createdAt: Date
    
    init(nickname: String, pronoun: Pronoun, birthdate: Date) {
        self.nickname = nickname
        self.pronoun = pronoun
        self.birthdate = birthdate
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddProfileRequestModel {
        return AddProfileRequestModel(
            userID: userID,
            nickname: nickname,
            pronounID: pronoun.rawValue,
            birthdate: birthdate,
            createdAt: createdAt
        )
    }
}
