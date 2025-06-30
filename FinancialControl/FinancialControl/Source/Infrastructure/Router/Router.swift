//
//  Router.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/06/25.
//

import SwiftUI
import Combine

// MARK: Router

@MainActor
final class Router: ObservableObject {
    
    // MARK: Properties
    
    @Published var path = NavigationPath()
    
    // MARK: Methods
    
    func push(_ destination: Destination) {
        path.append(destination)
    }
    
    func pop(count: Int = 1) {
        path.removeLast(count)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
      }
    
    @ViewBuilder func getDestination(from destination: Destination) -> some View {
        switch destination {
        case .subPaymentTypeForm(let subPaymentType):
            SubPaymentTypesFormView(subPaymentType: subPaymentType)
        default:
            Text("in development")
        }
    }
    
    @ViewBuilder func getFeatures(from selection: Features?) -> some View {
        switch selection {
        case .home:
            HomeView()
        case .subPayment:
            SubPaymentTypeListView()
        case .none:
            EmptyView()
        }
    }
}

// MARK: Navigation Option

enum Destination: Hashable {
    case paymentForm
    case monthlyPaymentForm
    case annualPaymentForm
    case purchaseInstallmentForm
    case productForm
    case subPaymentTypeForm(SubPaymentType? = nil)
    case budgetForm
    case creditCardForm
}

enum Features: String, CaseIterable, Hashable, Identifiable {
    case home
    case subPayment
    
    var id: Int {
        switch self {
        case .home:
            return 0
        case .subPayment:
            return 1
        }
    }
}
