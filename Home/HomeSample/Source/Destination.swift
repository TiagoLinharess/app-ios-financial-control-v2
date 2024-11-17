//
//  Destination.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Router
import Home
import SwiftUI

// TODO: Implementar no core sample
public enum Destination<T: FacadeProtocol>: DestinationProtocol {
    case home(T)
    case singleForm
    case paymentType
    case creditCard
    case products
    case budgets
    case bills

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
        case .home(let facade):
            facade.getView()
        default:
            Text(self.title)
        }
    }
}
