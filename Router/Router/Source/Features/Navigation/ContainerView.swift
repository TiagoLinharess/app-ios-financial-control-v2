//
//  ContainerView.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

public extension Router.Features.Navigation {
    struct ContainerView<Content: View>: View {
        
        // MARK: - Properties -
        
        @StateObject var path = Path()
        @ViewBuilder private let content: Content
        
        // MARK: - Init -
        
        public init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        // MARK: - Body -
        
        public var body: some View {
            NavigationStack(path: $path.navPath) {
                content
                    .navigationDestination(
                        for: Destination.self,
                        destination: path.handle(to:)
                    )
            }
            .environmentObject(path)
        }
    }
}
