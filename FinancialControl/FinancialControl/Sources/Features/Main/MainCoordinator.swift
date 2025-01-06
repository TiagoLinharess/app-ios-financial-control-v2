//
//  MainCoordinator.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 06/01/25.
//

import Router
import UIKit

final class MainCoordinator: AppCoordinator, DestinationProtocol {
    
    // MARK: Propeties
    
    let navigationController: UINavigationController
    var parentCoordinator: AppCoordinator?
    var childCoordinators: [AppCoordinator] = []
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Public methods
    
    func navigate(to destination: Destination) {
        switch destination {
        case .home:
            break
        case .login(let loginDestination):
            navigateToLogin(to: loginDestination)
        case .payment:
            break
        case .paymentType:
            break
        case .creditCard:
            break
        case .product:
            break
        case .budget:
            break
        case .bill:
            break
        }
    }
}
