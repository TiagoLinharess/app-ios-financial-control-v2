//
//  ShortcutsAppReducer.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Router

// MARK: - Typealias -

typealias ShortcutsAppReducer<ShortcutsAppState, ShortcutsAppAction> = (
    inout ShortcutsAppState,
    ShortcutsAppAction
) -> Void

// MARK: - Reducer -

func shortcutsAppReducer(state: inout ShortcutsAppState, action: ShortcutsAppAction) {
    switch action {
        case .fetch:
        state.items = [
            .singleForm,
            .paymentType,
            .creditCard,
            .products,
            .budgets,
            .bills
        ]
    }
}
