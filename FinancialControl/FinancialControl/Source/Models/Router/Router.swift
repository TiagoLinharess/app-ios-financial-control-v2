//
//  Router.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/06/25.
//

import Combine
import SwiftUI

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
            CategoryListContainerView()
        case .categoryDetail(let id):
            CategoryDetailView(id: id)
        case .categoryForm(let viewModel):
            CategoryFormView(category: viewModel)
        case .tags:
            TagListContainerView()
        default:
            Text("in development")
        }
    }
}

// MARK: Navigation Option

enum Destination: Hashable {
    case categories
    case categoryDetail(String)
    case categoryForm(CategoryViewModel? = nil)
    case tags
    case creditcard
}
