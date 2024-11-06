//
//  Router.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

// TODO: Create Rrouter Module

public enum Navigation {
    public enum Features {}
}

public extension Navigation.Features {
    enum Router {}
}

public extension Navigation.Features.Router {
    struct ContainerView<Content: View>: View {
        @StateObject var path = Navigation.Features.Router.Path()
        @ViewBuilder private let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        public var body: some View {
            NavigationStack(path: $path.navPath) {
                content
                    .navigationDestination(
                        for: Navigation.Features.Router.Destination.self,
                        destination: path.handle(to:)
                    )
            }
            .environmentObject(path)
        }
    }
}


public extension Navigation.Features.Router {
    enum Destination: Codable, Hashable {
        case featureA
        case featureB
    }
    
    final class Path: ObservableObject {
        @Published var navPath = NavigationPath()
        
        @ViewBuilder
        public func handle(to destination: Destination) -> some View {
            switch destination {
            case .featureA:
                FeatureA()
            case .featureB:
                FeatureB()
            }
        }
        
        public func navigate(to destination: Destination) {
            navPath.append(destination)
        }
        
        public func navigateBack() {
            navPath.removeLast()
        }
        
        public func navigateToRoot() {
            navPath.removeLast(navPath.count)
        }
    }
}
