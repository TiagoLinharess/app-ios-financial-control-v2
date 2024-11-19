//
//  HomeFacade.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//
import Core
import SwiftUI

// MARK: - Protocol -

public protocol HomeFacadeProtocol: FacadeProtocol {
    func start(externalNavigateCompletion: @escaping ExternalDestinationCompletion)
}

public struct HomeFacade: HomeFacadeProtocol {
    // MARK: - Init -
    
    public init() {}
    
    // MARK: - Public Methods -
    
    public func start(externalNavigateCompletion: @escaping ExternalDestinationCompletion) {
        startSingleton(externalNavigateCompletion: externalNavigateCompletion)
    }
    
    @ViewBuilder
    public func getView() -> some View {
        let builder = HomeBuilder()
        builder.build()
    }
    
    // MARK: - Private Methods -
    
    private func startSingleton(externalNavigateCompletion: @escaping ExternalDestinationCompletion) {
        HomeSingleton.start(externalNavigateCompletion: externalNavigateCompletion)
    }
}
