//
//  LoginSingleton.swift
//  Login
//
//  Created by Tiago Linhares on 24/01/25.
//

import Router

protocol LoginSingletonProtocol {
    static var shared: LoginSingleton? { get }
    static func start(onFinish: @escaping FinishCompletion, onAbort: @escaping FinishCompletion)
    func finish()
    func abort()
}

final class LoginSingleton: LoginSingletonProtocol {
    
    // MARK: Shared
    
    private(set) static var shared: LoginSingleton?
    
    // MARK: Properties
    
    private var onFinish: FinishCompletion?
    private var onAbort: FinishCompletion?
    
    // MARK: Start
    
    static func start(onFinish: @escaping FinishCompletion, onAbort: @escaping FinishCompletion) {
        shared = LoginSingleton()
        shared?.onFinish = onFinish
        shared?.onAbort = onAbort
    }
    
    // MARK: Finish
    
    func finish() {
        onFinish?()
        LoginSingleton.shared = nil
    }
    
    func abort() {
        onAbort?()
        LoginSingleton.shared = nil
    }
}
