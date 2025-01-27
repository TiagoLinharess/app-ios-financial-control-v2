//
//  LoginSingleton.swift
//  Login
//
//  Created by Tiago Linhares on 24/01/25.
//

import Router

protocol LoginSingletonProtocol {
    static var shared: LoginSingleton? { get }
    static func start(onFinish: @escaping FinishCompletion)
    func finish()
}

final class LoginSingleton: LoginSingletonProtocol {
    
    // MARK: Shared
    
    private(set) static var shared: LoginSingleton?
    
    // MARK: Properties
    
    private var onFinish: FinishCompletion?
    
    // MARK: Start
    
    static func start(onFinish: @escaping FinishCompletion) {
        shared = LoginSingleton()
        shared?.onFinish = onFinish
    }
    
    // MARK: Finish
    
    func finish() {
        onFinish?()
        LoginSingleton.shared = nil
    }
}
