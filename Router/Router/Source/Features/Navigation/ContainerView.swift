//
//  ContainerView.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

public struct ContainerRouterView<Content: View>: View {
    
    // MARK: - Properties -
    
    @StateObject var router = Router()
    @ViewBuilder private let content: Content
    
    // MARK: - Init -
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body -
    
    public var body: some View {
        NavigationStack(path: $router.navPath) {
            content
                .navigationDestination(
                    for: Destination.self,
                    destination: router.handle(to:)
                )
        }
        .environmentObject(router)
    }
}
