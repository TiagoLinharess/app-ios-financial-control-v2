//
//  ProfileDataModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import Foundation

struct ProfileDataModel {
    let id: String
    let nickname: String
    let pronoun: Pronoun
    let birthdate: Date
    let createdAt: Date
    
    init(id: String, nickname: String, pronoun: Pronoun, birthdate: Date, createdAt: Date) {
        self.id = id
        self.nickname = nickname
        self.pronoun = pronoun
        self.birthdate = birthdate
        self.createdAt = createdAt
    }
    
    init?(from response: ProfileResponseModel?) {
        guard let response,
              let id = response.id,
              let pronoun = Pronoun(rawValue: response.pronounID)
        else {
            return nil
        }
        
        self.id = id
        self.nickname = response.nickname
        self.pronoun = pronoun
        self.birthdate = response.birthdate
        self.createdAt = response.createdAt
    }
    
    func toRequestModel(userID: String) -> EditProfileRequestModel {
        return EditProfileRequestModel(
            id: id,
            userID: userID,
            nickname: nickname,
            pronounID: pronoun.rawValue,
            birthdate: birthdate,
            createdAt: createdAt
        )
    }
}
