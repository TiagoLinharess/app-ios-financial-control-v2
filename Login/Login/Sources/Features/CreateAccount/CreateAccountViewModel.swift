//
//  CreateAccountViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezCore
import SharpnezDesignSystemUIKit

protocol CreateAccountViewModelProtocol {
    var viewStatus: Bindable<ViewStatus> { get }
    func submit(_ model: CreateAccountModel)
}

final class CreateAccountViewModel: CreateAccountViewModelProtocol {
    
    // MARK: Properties
    
    private(set) var viewStatus: Bindable<ViewStatus> = Bindable(.none)
    private let service: CreateAccountServiceProtocol
    
    // MARK: Init
    
    init(service: CreateAccountServiceProtocol = CreateAccountService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func submit(_ model: CreateAccountModel) {
        Task {
            do {
                viewStatus.value = .loading
                try await service.submit(model)
                viewStatus.value = .success
            } catch {
                viewStatus.value = .error((error as? CoreError)?.message ?? String())
            }
        }
    }
}

private extension CreateAccountViewModel {
    
    // MARK: Private methods
    
    /// Code
}
