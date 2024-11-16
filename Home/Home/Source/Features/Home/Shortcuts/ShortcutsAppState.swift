//
//  ShortcutsAppState.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Router

struct ShortcutsAppState: Equatable {
    // MARK: - Properties -
    
    var items: [Destination] = []
    
    // MARK: - Equatable -
    
    static func == (lhs: ShortcutsAppState, rhs: ShortcutsAppState) -> Bool {
        lhs.items.first?.title == rhs.items.first?.title
    }
}
