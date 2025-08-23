//
//  CategoryListItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct CategoryListItemView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    private let category: CategoryDataModel
    
    // MARK: Init
    
    init(category: CategoryDataModel) {
        self.category = category
    }
    
    // MARK: Body
    
    public var body: some View {
        Button(action: handleTap) {
            CategoryItemView(icon: category.icon, name: category.name)
        }
        .buttonStyle(.plain)
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        router.push(.categoryDetail(category.id))
    }
}
