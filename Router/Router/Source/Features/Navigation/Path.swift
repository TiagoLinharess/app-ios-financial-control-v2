//
//  Path.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

public extension Router.Features.Navigation {
    
    // MARK: - Destination -
    
    enum Destination: Codable, Hashable {
        case featureA
        case featureB
    }
    
    // MARK: - Path -
    
    final class Path: ObservableObject {
        @Published public var navPath = NavigationPath()
        
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
