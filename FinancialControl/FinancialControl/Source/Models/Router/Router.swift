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
        case .categories:
            CategoryListView()
        default:
            Text("in development")
        }
    }
}

// MARK: Navigation Option

enum Destination: Hashable {
    case categories
    case products
}
