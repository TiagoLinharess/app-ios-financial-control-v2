//
//  ShortcutsAppStore.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

// MARK: - Protocol -

protocol ShortcutsAppStoreProtocol: ObservableObject {
    var state: ShortcutsAppState { get }
    func dispatch(action: ShortcutsAppAction)
}

// MARK: - Store -

final class ShortcutsAppStore: ShortcutsAppStoreProtocol {
    // MARK: - Properties -
    
    @Published private(set) var state: ShortcutsAppState
    private let reducer: ShortcutsAppReducer<ShortcutsAppState, ShortcutsAppAction>
    
    // MARK: - Init -
    
    init(
        initialState: ShortcutsAppState,
        reducer: @escaping ShortcutsAppReducer<ShortcutsAppState, ShortcutsAppAction>
    ) {
        self.state = initialState
        self.reducer = reducer
    }
    
    // MARK: - Dispatch -
    
    func dispatch(action: ShortcutsAppAction) {
        reducer(&state, action)
    }
}
