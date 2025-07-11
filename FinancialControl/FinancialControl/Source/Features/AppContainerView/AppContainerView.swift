//
//  AppContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 09/07/25.
//

import SwiftUI

struct AppContainerView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var authentication: Authentication
    @StateObject private var router = Router()
    @State private var contentSelection: Features? = .home
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    
    // MARK: Body
    
    var body: some View {
        if authentication.user == nil {
            UnLoggedView()
        } else {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
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
