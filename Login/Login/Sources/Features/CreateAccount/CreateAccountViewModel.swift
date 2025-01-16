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
    
    private let service: CreateAccountServiceProtocol
    
    // MARK: Init
    
    init(service: CreateAccountServiceProtocol = CreateAccountService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func submit(_ model: CreateAccountModel) {
        Task {
            do {
                try await service.submit(model)
                print("success")
            } catch {
                print(error)
            }
        }
    }
}

private extension CreateAccountViewModel {
    
    // MARK: Private methods
    
    /// Code
}
