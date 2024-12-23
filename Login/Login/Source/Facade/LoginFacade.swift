//
//  LoginFacade.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//
import Core
import SwiftUI

// MARK: - Protocol -

public protocol LoginFacadeProtocol: FacadeProtocol {
    mutating func start(
        destination: LoginDestination,
        completion: @escaping FinishCompletion
    )
}

public struct LoginFacade: LoginFacadeProtocol {
    // MARK: - Properties -
    
    private var destination: LoginDestination?
    
    // MARK: - Init -
    
    public init() {}
    
    // MARK: - Public Methods -
    
    public mutating func start(
        destination: LoginDestination,
        completion: @escaping FinishCompletion
    ) {
        self.destination = destination
        startSingleton(completion: completion)
    }
    
    @ViewBuilder
    public func getView() -> some View {
        CreateAccountView()
    }
    
    // MARK: - Private Methods -
    
    private func startSingleton(completion: @escaping FinishCompletion) {
        LoginSingleton.start(completion: completion)
    }
}
