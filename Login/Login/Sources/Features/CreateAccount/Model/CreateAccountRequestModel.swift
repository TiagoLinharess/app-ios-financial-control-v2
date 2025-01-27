//
//  CreateAccountRequestModel.swift
//  Login
//
//  Created by Tiago Linhares on 15/01/25.
//

import SharpnezCore

struct CreateAccountRequestModel: Encodable {
    let name: String
    let familyName: String
    let email: String
    let password: String
    
    init(from model: CreateAccountModel) {
        self.name = model.name
        self.familyName = model.familyName
        self.email = model.email
        self.password = model.password.encripted
    }
}
