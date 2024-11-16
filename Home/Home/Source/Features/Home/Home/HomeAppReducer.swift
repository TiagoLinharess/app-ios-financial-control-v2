//
//  Reducer.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

// MARK: - Typealias -

typealias HomeAppReducer<HomeAppState, HomeAppAction> = (inout HomeAppState, HomeAppAction) -> Void

// MARK: - Reducer -

func homeAppReducer(state: inout HomeAppState, action: HomeAppAction) {
    switch action {
        case .fetch:
        state.items = [
            .shortcuts,
            .graphs,
            .budgets,
            .bills
        ]
    }
}
