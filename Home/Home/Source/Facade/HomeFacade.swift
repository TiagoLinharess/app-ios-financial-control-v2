//
//  HomeFacade.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

public typealias ExternalDestinationCompletion = (ExternalDestination) -> Void


// TODO: Mover ExternalDestination, FacadeProtocol, ExternalDestinationDelegate para Core
public enum ExternalDestination: String {
    case singleForm
    case paymentType
    case creditCard
    case products
    case budgets
    case bills

    public var title: String {
        switch self {
        case .singleForm:
            "Single Form"
        case .paymentType:
            "Payment Type"
        case .creditCard:
            "Credit Card"
        case .products:
            "Products"
        case .budgets:
            "Budgets"
        case .bills:
            "Bills"
        }
    }

    public var iconName: String {
        switch self {
        case .singleForm:
            "dollarsign"
        case .paymentType:
            "list.bullet"
        case .creditCard:
            "creditcard"
        case .products:
            "bookmark"
        case .budgets:
            "calendar.day.timeline.left"
        case .bills:
            "calendar"
        }
    }
}

public protocol ExternalDestinationDelegate {
    func didNavigate(to externalDestination: ExternalDestination)
}

// MARK: - Facade -

public protocol FacadeProtocol: Hashable {
    associatedtype ContentView: View
    func getView() -> ContentView
}

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
