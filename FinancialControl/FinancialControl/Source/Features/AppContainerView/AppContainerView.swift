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
    @StateObject private var router = Router()
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Body
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.start()
        }
        .onAppear(perform: handleStart)
        .onChange(of: scenePhase) { oldValue, newValue in
            validateScenePhase(oldValue: oldValue, newValue: newValue)
        }
        .environmentObject(router)
    }
    
    // MARK: Private methods
    
    private func handleStart() {
        if viewModel.sessionValidated() {
            router.push(.home)
        }
    }
    
    private func validateScenePhase(oldValue: ScenePhase, newValue: ScenePhase) {
        guard newValue == .active && (oldValue == .background || oldValue == .inactive) else {
            return
        }
        
        handleAppContext()
    }
    
    private func handleAppContext() {
        if !viewModel.sessionValidated() {
            router.popToRoot()
        }
    }
}
