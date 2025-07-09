//
//  ContainerAppView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/06/25.
//

import SwiftUI

struct ContainerAppView: View {
    
    // MARK: Properties
    
    @StateObject private var router = Router()
    @State private var contentSelection: Features? = .home
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    // MARK: Body
    
    var body: some View {
        LocalBiometryContainerView {
            NavigationSplitView(columnVisibility: $columnVisibility) {
                List(selection: $contentSelection) {
                    ForEach(Features.allCases, id: \.self) { item in
                        Text(item.rawValue.capitalized)
                            .tag(item as Features?)
                    }
                }
                .navigationTitle(Localizable.Commons.menu)
            } detail: {
                NavigationStack(path: $router.path) {
                    Group {
                        router.getFeatures(from: contentSelection)
                    }
                    .navigationDestination(for: Destination.self) { destination in
                        router.getDestination(from: destination)
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
