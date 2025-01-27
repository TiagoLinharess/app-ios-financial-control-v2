//
//  CreateAccountCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import Router

final class CreateAccountCoordinator: AppCoordinator {
    
    // MARK: Propeties
    
    private let singleton: LoginSingletonProtocol?
    let navigationController: UINavigationController
    var parentCoordinator: AppCoordinator?
    var childCoordinators: [AppCoordinator] = []
    
    // MARK: Init
    
    init(
        navigationController: UINavigationController,
        singleton: LoginSingletonProtocol? = LoginSingleton.shared
    ) {
        self.navigationController = navigationController
        self.singleton = singleton
    }
    
    // MARK: Public methods

    func start() {
        let builder = CreateAccountBuilder()
        let controller = builder.build(onFinish: navigateToSuccess, onAbort: didAbort)
        navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: Private methods
    
    func navigateToSuccess() {
        let coordinator = SuccessCreateAccountCoordinator(
            navigationController: navigationController
        )
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func didAbort() {
        singleton?.abort()
    }
}
