//
//  LoginContainerView.swift
//  Login
//
//  Created by Tiago Linhares on 23/12/24.
//

import SwiftUI

public struct LoginContainerView: View {
    
    // MARK: Properties
    
    private let destination: LoginDestination
    
    // MARK: Init
    
    public init(destination: LoginDestination) {
        self.destination = destination
    }
    
    // MARK: Body
    
    public var body: some View {
        destinationView
    }
    
    var destinationView: some View {
        Group {
            switch destination {
            case .signIn:
                Text("signIn")
            case .signUp:
                SignUpView()
            }
        }
    }
}
