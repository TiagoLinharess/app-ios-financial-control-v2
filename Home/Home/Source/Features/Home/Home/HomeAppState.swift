//
//  HomeAppState.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

struct HomeAppState: Equatable {
    // MARK: - Properties -
    
    var items: [HomeItemsType] = []
    
    // MARK: - Equatable -
    
    static func == (lhs: HomeAppState, rhs: HomeAppState) -> Bool {
        lhs.items.first?.rawValue == rhs.items.first?.rawValue
    }
}
