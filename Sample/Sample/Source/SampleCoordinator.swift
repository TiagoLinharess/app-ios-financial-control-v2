//
//  SampleCoordinator.swift
//  Sample
//
//  Created by Tiago Linhares on 07/01/25.
//

import Router
import UIKit

public final class SampleCoordinator: AppCoordinator {
    
    // MARK: Properties
    
    public var navigationController: UINavigationController = UINavigationController()
    public var parentCoordinator: AppCoordinator?
    public var childCoordinators: [AppCoordinator] = []
    public var sampleItem: [SampleItem]
    
    // MARK: Init
    
    public init(sampleItem: [SampleItem]) {
        self.sampleItem = sampleItem
    }

    public func start() {
        let controller = SampleViewController(sampleItem: sampleItem)
        navigationController.pushViewController(controller, animated: true)
    }
}
