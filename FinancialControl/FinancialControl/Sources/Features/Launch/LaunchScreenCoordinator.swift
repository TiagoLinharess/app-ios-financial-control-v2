//
//  LaunchScreenCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

final class LaunchScreenCoordinator: AppCoordinator {
    
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
        let builder = LaunchScreenBuilder()
        let controller = builder.build(onFinish: navigateToStart)
        navigationController.pushViewController(controller, animated: true)
    }
    
    // MARK: Private methods
    
    func navigateToStart() {
        let childCoordinator = StartCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
        childCoordinators.append(childCoordinator)
    }
}
