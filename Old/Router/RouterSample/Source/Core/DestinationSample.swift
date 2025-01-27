//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 16/11/24.

import Router
import SwiftUI

public enum Destination: DestinationProtocol {
    case Home
    case SingleForm
    case PaymentType
    case Products
    case Budgets
    case Bills

    public var title: String {
        switch self {
        case .Home:
            "Home"
        case .SingleForm:
            "Single Form"
        case .PaymentType:
            "Payment Type"
        case .Products:
            "Products"
        case .Budgets:
            "Budgets"
        case .Bills:
            "Bills"
        }
    }

    public var iconName: String {
        switch self {
        case .Home:
            "house"
        case .SingleForm:
            "dollarsign"
        case .PaymentType:
            "list.bullet"
        case .Products:
            "bookmark"
        case .Budgets:
            "calendar.day.timeline.left"
        case .Bills:
            "calendar"
        }
    }

    @ViewBuilder
    public var view: some View {
        Text(self.title)
    }
}
