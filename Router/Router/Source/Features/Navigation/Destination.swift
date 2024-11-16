//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 14/11/24.
//

import SwiftUI

public enum Destination: CaseIterable, Codable, Hashable {
    case home
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
            "Add Payment"
        case .paymentType:
            "Payment Types"
        case .creditCard:
            "Credit Cards"
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
        Text(self.title)
    }
}
