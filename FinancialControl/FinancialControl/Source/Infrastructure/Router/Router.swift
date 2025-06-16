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
    
    @Published private var paths: [Tab: [Destination]] = [:]
    var selectedTab: Tab = .home
    
    subscript(tab: Tab) -> [Destination] {
        get { paths[tab] ?? [] }
        set { paths[tab] = newValue }
    }
    
    var selectedTabPath: [Destination] {
        paths[selectedTab] ?? []
    }
    
    // MARK: Methods
    
    func push(_ destination: Destination, for tab: Tab? = nil) {
        let targetTab = tab ?? selectedTab
        if paths[targetTab] == nil {
            paths[targetTab] = [destination]
        } else {
            paths[targetTab]?.append(destination)
        }
    }
    
    func pop(for tab: Tab? = nil) {
        let targetTab = tab ?? selectedTab
        if paths[targetTab]?.isEmpty == false {
            paths[targetTab]?.removeLast()
        }
    }
    
    func popToRoot(for tab: Tab? = nil) {
        paths[tab ?? selectedTab] = []
      }
    
    @ViewBuilder func getDestination(from destination: Destination) -> some View {
        Text(destination.rawValue)
    }
}

// MARK: Navigation Option

enum Destination: String, Hashable {
    case add
    case addPayment
    case addMonthlyPayment
    case addAnnualPayment
    case addPurchaseInstallment
}

enum Tab: String, CaseIterable, Hashable, Identifiable {
    case home
    case budgets
    case bills
    case settings
    
    var id: Int {
        switch self {
        case .home:
            return 0
        case .budgets:
            return 1
        case .bills:
            return 2
        case .settings:
            return 3
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return Localizable.Modules.home
        case .budgets:
            return Localizable.Modules.budgets
        case .bills:
            return Localizable.Modules.bills
        case .settings:
            return Localizable.Modules.settings
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return Constants.Icon.home
        case .budgets:
            return Constants.Icon.budgets
        case .bills:
            return Constants.Icon.bills
        case .settings:
            return Constants.Icon.settings
        }
    }
    
    var view: AnyView {
        switch self {
        case .home:
            return AnyView(HomeView())
        case .budgets:
            return AnyView(Text(Localizable.Modules.budgets))
        case .bills:
            return AnyView(Text(Localizable.Modules.bills))
        case .settings:
            return AnyView(Text(Localizable.Modules.settings))
        }
    }
}
