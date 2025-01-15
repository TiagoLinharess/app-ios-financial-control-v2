//
//  CreateAccountViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

protocol CreateAccountViewModelProtocol {
    func submit(_ model: CreateAccountModel)
}

final class CreateAccountViewModel: CreateAccountViewModelProtocol {
    
    // MARK: Properties
    
    /// Code
    
    // MARK: Init
    
    /// Code
    
    // MARK: Public methods
    
    func submit(_ model: CreateAccountModel) {
        print(model)
    }
}

private extension CreateAccountViewModel {
    
    // MARK: Private methods
    
    /// Code
}
