//
//  ShortcutsBuilder.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

struct ShortcutsBuilder {
    
    @ViewBuilder
    func build() -> some View {
        let appState = ShortcutsAppState()
        let store = ShortcutsAppStore(initialState: appState, reducer: shortcutsAppReducer(state:action:))
        ShortcutsView(store: store)
    }
}
