//
//  Router.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/06/25.
//

import Combine
import SwiftUI

// MARK: Delegate

protocol RouterDelegate: AnyObject {
    func remakeSession()
}

// MARK: Router

@MainActor
final class Router: ObservableObject {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    @Published var path: NavigationPath
    
    // MARK: Init
    
    init(path: NavigationPath = NavigationPath()) {
        self.path = path
        session.delegate = self
    }
    
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
    
    @ViewBuilder
    func start() -> some View {
        self.getDestination(from: .login)
            .navigationDestination(for: Destination.self) { destination in
                self.getDestination(from: destination)
            }
    }
    
    // MARK: Private methods
    
    @ViewBuilder
    private func getDestination(from destination: Destination) -> some View {
        switch destination {
        case .login:
            LoginView(viewModel: LoginViewModel())
        case .home:
            HomeView(viewModel: HomeViewModel())
        case .categories:
            CategoryListContainerView(viewModel: CategoryListViewModel())
        case .categoryForm(let model):
            CategoryFormView(viewModel: CategoryFormViewModel(model: model))
        case .tags:
            TagListContainerView(viewModel: TagListViewModel())
        case .tagForm(let model):
            TagFormView(viewModel: TagFormViewModel(model: model))
        default:
            Text("in development")
        }
    }
}

extension Router: RouterDelegate {
    
    // MARK: Delegate implementation
    
    func remakeSession() {
        popToRoot()
    }
}

enum Destination: Hashable {
    
    // MARK: Navigation Option
    
    case login
    case firstLoginForm
    case home
    case categories
    case categoryForm(CategoryDataModel? = nil)
    case tags
    case tagForm(TagDataModel? = nil)
    case creditcard
}
