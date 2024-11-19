//
//  HomeBuilder.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

struct HomeBuilder {
    
    @ViewBuilder
    func build() -> some View {
        let state = HomeAppState()
        let store = HomeAppStore(initialState: state, reducer: homeAppReducer(state:action:))
        HomeView(store: store)
    }
}
