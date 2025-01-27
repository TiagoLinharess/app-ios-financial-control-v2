//
//  StartBuilder.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

struct StartBuilder {
    func build(
        onNavigateToLogin: (() -> Void)?,
        onNavigateToCreateAccount: (() -> Void)?
    ) -> UIViewController {
        let view = StartView()
        let viewModel = StartViewModel()
        let controller = StartViewController(customView: view, viewModel: viewModel)
        
        viewModel.onNavigateToLogin = onNavigateToLogin
        viewModel.onNavigateToCreateAccount = onNavigateToCreateAccount
        
        return controller
    }
}
