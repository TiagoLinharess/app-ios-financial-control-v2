//
//  HomeFacade.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//
import Core
import SwiftUI

// MARK: - Typealias -

public typealias ExternalDestinationCompletion = (ExternalDestination) -> Void

// MARK: - Protocol -

public protocol HomeFacadeProtocol: FacadeProtocol {
    func start(externalDestinationDelegate: ExternalDestinationDelegate)
}

public struct HomeFacade: HomeFacadeProtocol {
    // MARK: - Init -
    
    public init() {}
    
    // MARK: - Public Methods -
    
    public func start(externalDestinationDelegate: ExternalDestinationDelegate) {
        startSingleton(externalDestinationDelegate: externalDestinationDelegate)
    }
    
    @ViewBuilder
    public func getView() -> some View {
        let builder = HomeBuilder()
        builder.build()
    }
    
    // MARK: - Private Methods -
    
    private func startSingleton(externalDestinationDelegate: ExternalDestinationDelegate) {
        HomeSingleton.start(externalDestinationDelegate: externalDestinationDelegate)
    }
}
