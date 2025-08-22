//
//  AuthenticationManager.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import Combine

@MainActor
final class AuthenticationManager: ObservableObject {
    @Published var user: UserModel?
}
