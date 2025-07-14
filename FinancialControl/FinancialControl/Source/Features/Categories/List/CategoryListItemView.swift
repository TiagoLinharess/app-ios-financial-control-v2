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
    private let category: CategoryViewModel
    private let isLast: Bool
    
    // MARK: Init
    
    init(category: CategoryViewModel, isLast: Bool) {
        self.category = category
        self.isLast = isLast
    }
    
    // MARK: Body
    
    public var body: some View {
        Button(action: handleTap) {
            HStack {
                Text(category.name)
                    .configureWithSH(
                        color: .onSurface(colorScheme: colorScheme),
                        font: .body(.montserrat, .regular)
                    )
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        if !isLast {
            Divider()
                .background(
                    Color.onSurface(colorScheme: colorScheme)
                )
        }
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        router.push(.categoryDetail(category.id))
    }
}
