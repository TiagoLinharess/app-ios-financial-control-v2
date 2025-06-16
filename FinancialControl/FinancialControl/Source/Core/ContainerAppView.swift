//
//  ContainerAppView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/06/25.
//

import SwiftUI

struct ContainerAppView: View {
    
    // MARK: Properties
    
    @StateObject var router = Router()
    
    // MARK: Body
    
    var body: some View {
        NavigationStack(path: $router.path) {
            HomeView()
                .navigationDestination(for: Destination.self) { destination in
                    router.getDestination(from: destination)
                }
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Menu {
                            ForEach(AddRoute.allCases) { route in
                                Button(route.title) {
                                    addNavigate(at: route)
                                }
                            }
                        } label: {
                            Image(systemName: Constants.Icons.add)
                        }
                    }
                    ToolbarItem(placement: .automatic) {
                        Button {
                            didTapSettingsButton()
                        } label: {
                            Image(systemName: Constants.Icons.settings)
                        }
                    }
                }
        }
        .environmentObject(router)
    }
    
    // MARK: Private methods
    
    private func didTapSettingsButton() {
        router.push(.settings)
    }
    
    private func addNavigate(at route: AddRoute) {
        router.push(route.destination)
    }
}
