//
//  AppContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import SwiftUI

struct AppContainerView<ViewModel: AppContainerViewModelProtocol>: View {
    
    // MARK: Properties
    
    private let viewModel: ViewModel
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject private var authentication: AuthenticationManager
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Body
    
    var body: some View {
        Group {
            if authentication.user == nil {
                LoginView()
            } else {
                contentView
            }
        }
        .onAppear(perform: handleAppContext)
        .onChange(of: scenePhase) { oldValue, newValue in
            validateScenePhase(oldValue: oldValue, newValue: newValue)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        NavigationStack(path: $router.path) {
            HomeContainerView()
                .navigationDestination(for: Destination.self) { destination in
                    router.getDestination(from: destination)
                }
        }
    }
    
    // MARK: Private methods
    
    private func validateScenePhase(oldValue: ScenePhase, newValue: ScenePhase) {
        guard newValue == .active && (oldValue == .background || oldValue == .inactive) else {
            return
        }
        
        handleAppContext()
    }
    
    private func handleAppContext() {
        authentication.user = viewModel.validateSession() // TODO: Remover a necessidade de alterar o estado aqui
    }
}
