//
//  AuthenticationService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import FirebaseAuth
import FirebaseCore
import GoogleSignIn

protocol AuthenticationServiceProtocol {
    func login() async throws -> UserModel
    func logout() async throws
    func validateSession() -> UserModel?
}

@MainActor
final class AuthenticationService: AuthenticationServiceProtocol {
    func login() async throws -> UserModel {
        do {
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                fatalError("no firbase clientID found")
            }
            
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            guard let rootViewController = (
                UIApplication
                    .shared
                    .connectedScenes
                    .first as? UIWindowScene
            )?
            .windows
            .first?
            .rootViewController
            else {
                fatalError("There is no root view controller!")
            }
            
            let result = try await GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController
            )
            
            guard let idToken = result.user.idToken?.tokenString else {
                throw FCError.userPermission
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken, accessToken: result.user.accessToken.tokenString
            )
            
            try await Auth.auth().signIn(with: credential)
            
            guard let currentUser = UserModel(from: Auth.auth().currentUser) else {
                throw FCError.userPermission
            }
            
            return currentUser
        } catch {
            if let fcError = error as? FCError {
                throw fcError
            }
            
            throw FCError(value: error.localizedDescription)
        }
    }
    
    func logout() async throws {
        do {
            GIDSignIn.sharedInstance.signOut()
            try Auth.auth().signOut()
        } catch {
            throw FCError(value: error.localizedDescription)
        }
    }
    
    func validateSession() -> UserModel? {
        UserModel(from: Auth.auth().currentUser)
    }
}
