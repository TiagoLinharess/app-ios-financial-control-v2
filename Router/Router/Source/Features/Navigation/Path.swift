//
//  Path.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

// MARK: - Destination -

public enum Destination: Codable, Hashable {
    case featureA
    case featureB
}

// MARK: - Path -

public final class Router: ObservableObject {
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
