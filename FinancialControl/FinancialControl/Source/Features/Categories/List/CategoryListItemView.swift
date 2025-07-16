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
    
    // MARK: Init
    
    init(category: CategoryViewModel) {
        self.category = category
    }
    
    // MARK: Body
    
    public var body: some View {
        Button(action: handleTap) {
            HStack {
                SHIcon(icon: category.icon)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.onSurface(colorScheme: colorScheme))
                    .frame(width: .big, height: .big)
                Text(category.name)
                    .configureWithSH(
                        color: .onSurface(colorScheme: colorScheme),
                        font: .body(.poppins, .regular)
                    )
                Spacer()
            }
            .padding(.small)
            .background(Color.surface(colorScheme: colorScheme))
            .clipShape(RoundedRectangle(cornerRadius: .small))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        router.push(.categoryDetail(category.id))
    }
}
