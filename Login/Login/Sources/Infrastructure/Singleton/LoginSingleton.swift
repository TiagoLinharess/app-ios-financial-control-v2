//
//  LoginSingleton.swift
//  Login
//
//  Created by Tiago Linhares on 24/01/25.
//

import Router

public protocol LoginSingletonProtocol {
    static var shared: LoginSingleton? { get }
    func start(onFinish: @escaping FinishCompletion)
    func finish()
}

public final class LoginSingleton: LoginSingletonProtocol {
    
    // MARK: Shared
    
    private(set) public static var shared: LoginSingleton? = LoginSingleton()
    
    // MARK: Properties
    
    private var onFinish: FinishCompletion?
    
    // MARK: Start
    
    public func start(onFinish: @escaping FinishCompletion) {
        self.onFinish = onFinish
    }
    
    // MARK: Finish
    
    public func finish() {
        onFinish?()
        LoginSingleton.shared = nil
    }
}
