//
//  SampleCoordinator.swift
//  Sample
//
//  Created by Tiago Linhares on 07/01/25.
//

import Router
import UIKit

final class SampleCoordinator: AppCoordinator {
    
    // MARK: Properties
    
    var navigationController: UINavigationController = UINavigationController()
    var parentCoordinator: AppCoordinator?
    var childCoordinators: [AppCoordinator] = []
    var onStart: () -> Void
    var sampleTitle: String
    
    // MARK: Init
    
    init(
        onStart: @escaping () -> Void,
        sampleTitle: String
    ) {
        self.onStart = onStart
        self.sampleTitle = sampleTitle
    }

    func start() {
        let controller = SampleViewController(onStart: onStart, sampleTitle: sampleTitle)
        navigationController.pushViewController(controller, animated: true)
    }
}
