//
//  LoginViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine
import SwiftUI
import SharpnezDesignSystemSwiftUI

protocol LoginViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var toast: SHToastViewModel? { get set }
    func login() async -> UserModel?
}

@MainActor
final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: Properties
    
    private let service: AuthenticationServiceProtocol
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func login() async -> UserModel? {
        defer { isLoading = false }
        isLoading = true
        do {
            return try await service.login()
        } catch {
            var message: String = error.localizedDescription
            if let fcError = error as? FCError {
                message = fcError.message
            }
            
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            return nil
        }
    }
}
