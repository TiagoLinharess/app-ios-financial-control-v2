//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 16/11/24.

import Core
import Router
import SwiftUI

public enum Destination<T: FacadeProtocol>: DestinationProtocol {
    case home(T)
    case singleForm(T)
    case paymentType(T)
    case creditCard(T)
    case products(T)
    case budgets(T)
    case bills(T)

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
        }
    }

    @ViewBuilder
    public var view: some View {
        switch self {
        case let .home(facade),
            let .singleForm(facade),
            let .paymentType(facade),
            let .creditCard(facade),
            let .products(facade),
            let .budgets(facade),
            let .bills(facade):
            facade.getView()
        }
    }
}
