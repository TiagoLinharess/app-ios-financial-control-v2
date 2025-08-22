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
    
    @Published var path: NavigationPath
    
    // MARK: Init
    
    init(path: NavigationPath = NavigationPath()) {
        self.path = path
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
    
    @ViewBuilder func getDestination(from destination: Destination) -> some View { // TODO: Remover nomenclatura de ViewModel
        switch destination {
        case .categories:
            CategoryListContainerView()
        case .categoryDetail(let id):
            CategoryDetailView(id: id)
        case .categoryForm(let viewModel):
            CategoryFormView(category: viewModel)
        case .tags:
            TagListContainerView()
        case .tagForm(let viewModel):
            TagFormView(tag: viewModel)
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
    case tagForm(TagViewModel? = nil)
    case creditcard
}

/*
 - Para ter certeza se isso vai dar certo, fazer um teste de push e pop na login, home e splash com os cenários de: Abrindo o app com login, abrindo o app sem login e logout
 - Fazer um push da splash para o login/home
 - Add login no router
 - Tornar o login a primeira tela do app
 - Remover AuthenticationManager
 - Remover SessionSingleton
 - Criar Session
 - Remover a logica das views AppContainerView, SideMenuView e LoginView e tratar com Session em suas viewModels
 - Implementar um meio ou do Session controlar o Router, ou do Router reagir a mudanças de estado no session
 */
