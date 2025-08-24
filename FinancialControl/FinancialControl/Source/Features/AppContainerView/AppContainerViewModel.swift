//
//  AppContainerViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine

protocol AppContainerViewModelProtocol {
    func sessionValidated() -> Bool
}

@MainActor
final class AppContainerViewModel: AppContainerViewModelProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    
    // MARK: Public methods
    
    func sessionValidated() -> Bool {
        session.validateSession()
    }
}
