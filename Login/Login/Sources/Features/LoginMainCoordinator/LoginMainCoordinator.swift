//
//  LoginMainCoordinator.swift
//  Login
//
//  Created by Tiago Linhares on 07/01/25.
//

import Router

final class LoginMainCoordinator: AppCoordinator {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var parentCoordinator: AppCoordinator?
    var childCoordinators: [AppCoordinator] = []
    private let destination: LoginDestination

    // MARK: Init
    
    init(
        navigationController: UINavigationController,
        destination: LoginDestination
    ) {
        self.navigationController = navigationController
        self.destination = destination
    }
    
    // MARK: Public methods
    
    func start() {
        switch destination {
        case .createAccount:
            navigateToCreateAccount()
        case .login:
            break
        }
    }
    
    // MARK: Private methods
    
    private func navigateToCreateAccount() {
        let coordinator = CreateAccountCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
