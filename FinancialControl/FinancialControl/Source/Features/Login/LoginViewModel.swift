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
    func login() async -> Bool
}

@MainActor
final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Public methods
    
    func login() async -> Bool {
        defer { isLoading = false }
        isLoading = true
        do {
            try await session.login()
            return true
        } catch {
            var message: String = error.localizedDescription
            if let fcError = error as? FCError {
                message = fcError.message
            }
            
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            return false
        }
    }
}
