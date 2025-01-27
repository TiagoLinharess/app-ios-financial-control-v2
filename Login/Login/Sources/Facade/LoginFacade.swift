//
//  LoginFacade.swift
//  Login
//
//  Created by Tiago Linhares on 07/01/25.
//

import IQKeyboardManagerSwift
import Router

public protocol LoginFacadeProtocol {
    var coordinator: AppCoordinator? { get }
    
    func start(
        navigationController: UINavigationController,
        at destination: LoginDestination,
        onFinish: @escaping FinishCompletion,
        onAbort: @escaping FinishCompletion
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
        onFinish: @escaping FinishCompletion,
        onAbort: @escaping FinishCompletion
    ) {
        startSingleton(onFinish: onFinish, onAbort: onAbort)
        coordinator = LoginMainCoordinator(
            navigationController: navigationController,
            destination: destination
        )
        coordinator?.start()
    }
    
    // MARK: Private methods
    
    private func startSingleton(onFinish: @escaping FinishCompletion, onAbort: @escaping FinishCompletion) {
        LoginSingleton.start { [weak self] in
            self?.finishCoordinators()
            onFinish()
        } onAbort: { [weak self] in
            self?.finishCoordinators()
            onAbort()
        }
    }
    
    private func finishCoordinators() {
        coordinator?.finishChildCoordinators()
        coordinator = nil
    }
}
