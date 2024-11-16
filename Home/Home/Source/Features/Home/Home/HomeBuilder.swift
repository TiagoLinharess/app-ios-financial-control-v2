//
//  HomeBuilder.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

public struct HomeBuilder {
    
    public init() { }
    
    @ViewBuilder
    public func build() -> some View {
        let state = HomeAppState()
        let store = HomeAppStore(initialState: state, reducer: homeAppReducer(state:action:))
        HomeView(store: store)
    }
}
