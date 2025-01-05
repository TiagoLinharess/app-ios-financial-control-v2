//
//  HomeItemsType.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum HomeItemsType: String, CaseIterable {
    case shortcuts
    case graphs
    case budgets
    case bills
    
    @ViewBuilder
    public var view: some View {
        switch self {
        case .shortcuts:
            ShortcutsBuilder().build()
        default:
            Text(self.rawValue)
        }
    }
}
