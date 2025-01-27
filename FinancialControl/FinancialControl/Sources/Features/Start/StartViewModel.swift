//
//  StartViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

protocol StartViewModelProtocol {
    func didTapLogin()
    func didTapCreateAccount()
}

final class StartViewModel: StartViewModelProtocol {
    
    // MARK: Properties
    
    var onNavigateToLogin: (() -> Void)?
    var onNavigateToCreateAccount: (() -> Void)?
    
    // MARK: Public methods
    
    func didTapLogin() {
        onNavigateToLogin?()
    }
    
    func didTapCreateAccount() {
        onNavigateToCreateAccount?()
    }
}
