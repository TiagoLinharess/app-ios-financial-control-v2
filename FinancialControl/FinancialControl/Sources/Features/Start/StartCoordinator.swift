//
//  StartCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import Router
import UIKit

final class StartCoordinator: AppCoordinator {
    
    // MARK: Propeties
    
    let navigationController: UINavigationController
    var parentCoordinator: AppCoordinator?
    var childCoordinators: [AppCoordinator] = []
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public mehtods

    func start() {
        let builder = StartBuilder()
        let controller = builder.build(
            onNavigateToLogin: navigateToLogin,
            onNavigateToCreateAccount: navigateToCreateAccount
        )

        navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: Private methods
    
    private func navigateToLogin() {
        startMainCoordinator(at: .login(.login))
    }
    
    private func navigateToCreateAccount() {
        startMainCoordinator(at: .login(.createAccount))
    }
    
    private func startMainCoordinator(at destination: Destination) {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.navigate(to: destination)
    }
}
