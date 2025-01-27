//
//  LaunchScreenViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

protocol LaunchScreenViewModelProtocol {
    func didFinish()
}

final class LaunchScreenViewModel: LaunchScreenViewModelProtocol {
    
    // MARK: Properties
    
    var onFinish: (() -> Void)?
    
    // MARK: Public methods
    
    func didFinish() {
        onFinish?()
    }
}
