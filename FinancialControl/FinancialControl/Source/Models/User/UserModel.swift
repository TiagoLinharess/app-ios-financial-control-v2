//
//  UserModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import FirebaseAuth
import Foundation

struct UserModel {
    let providerID: String
    let uid: String
    let displayName: String
    let photoURL: URL?
    let email: String
    
    init (providerID: String, uid: String, displayName: String, photoURL: URL?, email: String) {
        self.providerID = providerID
        self.uid = uid
        self.displayName = displayName
        self.photoURL = photoURL
        self.email = email
    }
    
    init?(from user: User?) {
        guard let user = user, let name = user.displayName, let email = user.email else {
            return nil
        }
        
        self.providerID = user.providerID
        self.uid = user.uid
        self.displayName = name
        self.photoURL = user.photoURL
        self.email = email
    }
}
