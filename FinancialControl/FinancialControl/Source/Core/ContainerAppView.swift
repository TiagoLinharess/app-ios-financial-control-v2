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
        GlassEffectContainer {
            TabView(selection: $router.selectedTab) {
                ForEach(Tab.allCases) { tab in
                    NavigationStack(path: $router[tab]) {
                        tab.view
                            .navigationDestination(for: Destination.self) { destination in
                                router.getDestination(from: destination)
                            }
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button(action: didTapAddButton) {
                                        Image(systemName: "plus")
                                    }
                                }
                            }
                    }
                    .tabItem {
                        Label(tab.title, systemImage: tab.icon)
                    }
                    .tag(tab)
                }
            }
        }
        .environmentObject(router)
    }
    
    // MARK: Private methods
    
    private func didTapAddButton() {
        router.push(.add)
    }
}
