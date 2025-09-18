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
    func login() async -> LoginStep?
}

@MainActor
final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: LoginWorkerProtocol
    
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    init(worker: LoginWorkerProtocol = LoginWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func login() async -> LoginStep? {
        defer { isLoading = false }
        isLoading = true
        do {
            let profile = try await worker.login()
            return profile != nil ? .existingUser : .newUser
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
