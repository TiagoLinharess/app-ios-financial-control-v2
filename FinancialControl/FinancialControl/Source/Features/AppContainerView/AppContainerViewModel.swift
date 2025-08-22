//
//  AppContainerViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine

protocol AppContainerViewModelProtocol {
    func validateSession() -> UserModel?
}

@MainActor
final class AppContainerViewModel: AppContainerViewModelProtocol {
    
    // MARK: Properties
    
    private let service: AuthenticationServiceProtocol
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func validateSession() -> UserModel? {
        service.validateSession()
    }
}
