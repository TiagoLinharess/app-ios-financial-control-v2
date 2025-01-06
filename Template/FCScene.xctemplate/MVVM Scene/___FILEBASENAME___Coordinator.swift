//
//  ___VARIABLE_productName:identifier___Coordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

final class ___VARIABLE_productName:identifier___Coordinator: AppCoordinator {
    
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
        let builder = ___VARIABLE_productName:identifier___Builder()
        let controller = builder.build()
        navigationController.pushViewController(controller, animated: true)
    }
}
