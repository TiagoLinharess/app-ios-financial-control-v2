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
    public var onStart: () -> Void
    public var sampleTitle: String
    
    // MARK: Init
    
    public init(
        onStart: @escaping () -> Void,
        sampleTitle: String
    ) {
        self.onStart = onStart
        self.sampleTitle = sampleTitle
    }

    public func start() {
        let controller = SampleViewController(onStart: onStart, sampleTitle: sampleTitle)
        navigationController.pushViewController(controller, animated: true)
    }
}
