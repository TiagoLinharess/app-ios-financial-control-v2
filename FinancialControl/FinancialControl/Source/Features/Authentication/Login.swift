//
//  Login.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import Combine
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import SwiftUI

@MainActor
final class Login: ObservableObject {
    
    // MARK: Properties
    
    @Published var isLoading = false
    
    // MARK: Public methods
    
    func perform() async {
        do {
            isLoading = true
            // google sign in
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                fatalError("no firbase clientID found")
            }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            //get rootView
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            guard let rootViewController = scene?.windows.first?.rootViewController
            else {
                fatalError("There is no root view controller!")
            }
            
            //google sign in authentication response
            let result = try await GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController
            )
            let user = result.user
            guard let idToken = user.idToken?.tokenString else {
                print("idToke")
                return
            }
            
            //Firebase auth
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken, accessToken: user.accessToken.tokenString
            )
            try await Auth.auth().signIn(with: credential)
            isLoading = false
        } catch {
            print(error)
        }
    }
    
    func logout() async {
        do {
            GIDSignIn.sharedInstance.signOut()
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
