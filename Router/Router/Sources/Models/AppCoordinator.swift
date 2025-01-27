//
//  AppCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

public protocol AppCoordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinator: AppCoordinator? { get set }
    var childCoordinators: [AppCoordinator] { get set }
    func start()
    func finish<T: AppCoordinator>(at coordinator: T)
    func finishChildCoordinators()
}

public extension AppCoordinator {
    
    func start() { fatalError() }
    
    func finish<T: AppCoordinator>(at coordinator: T) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
    func finishChildCoordinators() {
        childCoordinators.enumerated().forEach { index, childCoordinator in
            childCoordinator.finishChildCoordinators()
            childCoordinators.remove(at: index)
        }
    }
}
