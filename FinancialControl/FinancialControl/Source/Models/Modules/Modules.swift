//
//  Modules.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/11/24.
//

import Core
import Router
import SwiftUI

enum Modules: DestinationProtocol {
    case home(any View)
    case login(any View)
    case singleForm(any View)
    case paymentType(any View)
    case creditCard(any View)
    case products(any View)
    case budgets(any View)
    case bills(any View)
    
    init(externalDestination: ExternalDestination, view: any View) {
        switch externalDestination {
        case .home:
            self = .home(view)
        case .login:
            self = .login(view)
        case .singleForm:
            self = .singleForm(view)
        case .paymentType:
            self = .paymentType(view)
        case .creditCard:
            self = .creditCard(view)
        case .products:
            self = .products(view)
        case .budgets:
            self = .budgets(view)
        case .bills:
            self = .bills(view)
        }
    }

    public var title: String {
        switch self {
        case .home:
            ExternalDestination.home.title
        case .login:
            ExternalDestination.login.title
        case .singleForm:
            ExternalDestination.singleForm.title
        case .paymentType:
            ExternalDestination.paymentType.title
        case .creditCard:
            ExternalDestination.creditCard.title
        case .products:
            ExternalDestination.products.title
        case .budgets:
            ExternalDestination.budgets.title
        case .bills:
            ExternalDestination.bills.title
        }
    }

    public var iconName: String {
        switch self {
        case .home:
            ExternalDestination.home.iconName
        case .login:
            ExternalDestination.login.iconName
        case .singleForm:
            ExternalDestination.singleForm.iconName
        case .paymentType:
            ExternalDestination.paymentType.iconName
        case .creditCard:
            ExternalDestination.creditCard.iconName
        case .products:
            ExternalDestination.products.iconName
        case .budgets:
            ExternalDestination.budgets.iconName
        case .bills:
            ExternalDestination.bills.iconName
        }
    }

    @ViewBuilder
    public var view: some View {
        switch self {
        case let .home(view),
            let .login(view),
            let .singleForm(view),
            let .paymentType(view),
            let .creditCard(view),
            let .products(view),
            let .budgets(view),
            let .bills(view):
            AnyView(view)
        }
    }
    
    static func == (lhs: Modules, rhs: Modules) -> Bool {
        lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
