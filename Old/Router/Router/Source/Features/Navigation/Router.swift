//
//  Router.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

// MARK: - Path -

public final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()
    
    @ViewBuilder
    public func handle<T: DestinationProtocol>(to destination: T) -> some View {
        destination.view
    }
    
    public func navigate(to destination: any DestinationProtocol) {
        navPath.append(destination)
    }
    
    public func navigateBack() {
        navPath.removeLast()
    }
    
    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
