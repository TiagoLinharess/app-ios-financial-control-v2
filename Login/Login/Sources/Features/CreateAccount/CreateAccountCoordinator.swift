//
//  CreateAccountCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import Router

final class CreateAccountCoordinator: AppCoordinator {
    
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
        let builder = CreateAccountBuilder()
        let controller = builder.build()
        navigationController.pushViewController(controller, animated: true)
    }
}
