//
//  SuccessCreateAccountCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import Router

final class SuccessCreateAccountCoordinator: AppCoordinator {
    
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
        let builder = SuccessCreateAccountBuilder()
        let controller = builder.build(finishAction: finish)
        navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: Private methods
    
    func finish() {
        singleton?.finish()
    }
}
