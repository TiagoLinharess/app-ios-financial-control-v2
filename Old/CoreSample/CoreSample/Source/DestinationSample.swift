//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 16/11/24.

import Core
import Router
import SwiftUI

public enum Destination: DestinationProtocol {
    case login(AnyView)
    case home(AnyView)
    case singleForm(AnyView)
    case paymentType(AnyView)
    case creditCard(AnyView)
    case products(AnyView)
    case budgets(AnyView)
    case bills(AnyView)

    public var title: String {
        switch self {
        case .home:
            "Home"
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
        case .login:
            "Login"
        }
    }

    public var iconName: String {
        switch self {
        case .home:
            "house"
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
        case .login:
            "person"
        }
    }
    
    public static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.title == rhs.title
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(title)
    }

    @ViewBuilder
    public var view: some View {
        switch self {
        case let .home(view),
            let .singleForm(view),
            let .paymentType(view),
            let .creditCard(view),
            let .products(view),
            let .budgets(view),
            let .bills(view),
            let .login(view):
            view
        }
    }
}
