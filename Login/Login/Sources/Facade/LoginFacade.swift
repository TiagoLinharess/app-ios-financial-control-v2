//
//  LoginFacade.swift
//  Login
//
//  Created by Tiago Linhares on 07/01/25.
//

import Router

public protocol LoginFacadeProtocol {
    var coordinator: AppCoordinator? { get }
    
    func start(
        navigationController: UINavigationController,
        at destination: LoginDestination,
        onFinish: @escaping FinishCompletion
    )
}

public final class LoginFacade: LoginFacadeProtocol {
    
    // MARK: Properties
    
    public var coordinator: AppCoordinator?

    // MARK: Init
    
    public init() { }
    
    // MARK: Public methods
    
    public func start(
        navigationController: UINavigationController,
        at destination: LoginDestination,
        onFinish: @escaping FinishCompletion
    ) {
        coordinator = LoginMainCoordinator(
            navigationController: navigationController,
            destination: destination
        )
        coordinator?.start()
    }
}
