//
//  HomeAppStore.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

// MARK: - Protocol -

protocol HomeAppStoreProtocol: ObservableObject {
    var state: HomeAppState { get }
    func dispatch(action: HomeAppAction)
}

// MARK: - Store -

final class HomeAppStore: HomeAppStoreProtocol {
    // MARK: - Properties -
    
    @Published private(set) var state: HomeAppState
    private let reducer: HomeAppReducer<HomeAppState, HomeAppAction>
    
    // MARK: - Init -
    
    init(
        initialState: HomeAppState,
        reducer: @escaping HomeAppReducer<HomeAppState, HomeAppAction>
    ) {
        self.state = initialState
        self.reducer = reducer
    }
    
    // MARK: - Dispatch -
    
    func dispatch(action: HomeAppAction) {
        reducer(&state, action)
    }
}
