//
//  ShortcutsAppState.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Core

struct ShortcutsAppState: Equatable {
    // MARK: - Properties -
    
    var items: [ExternalDestination] = []
    
    // MARK: - Equatable -
    
    static func == (lhs: ShortcutsAppState, rhs: ShortcutsAppState) -> Bool {
        lhs.items.first?.title == rhs.items.first?.title
    }
}
