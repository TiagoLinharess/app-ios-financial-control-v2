//
//  LoginSingleton.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//

import Core
import SwiftUI

protocol LoginSingletonProtocol {
    static var shared: LoginSingleton? { get }
    static func start(completion: @escaping FinishCompletion)
    func finish()
}

final class LoginSingleton: NSObject, LoginSingletonProtocol {
    // MARK: - Singleton -
    
    static var shared: LoginSingleton?
    
    // MARK: - Properties -
    
    private var completion: FinishCompletion?
    
    // MARK: - Start -
    
    static func start(completion: @escaping FinishCompletion) {
        shared = LoginSingleton()
        shared?.completion = completion
    }
    
    // MARK: - Finish -
    
    func finish() {
        completion?()
        LoginSingleton.shared?.completion = nil
        LoginSingleton.shared = nil
    }
}
