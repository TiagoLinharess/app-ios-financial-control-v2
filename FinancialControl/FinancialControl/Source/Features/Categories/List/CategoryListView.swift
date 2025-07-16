//
//  CategoryListView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryListView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var model: Category
    private let transactionType: TransactionType
    private let categories: [CategoryViewModel]
    
    // MARK: Init
    
    init(
        transactionType: TransactionType,
        categories: [CategoryViewModel]
    ) {
        self.transactionType = transactionType
        self.categories = categories
    }
    
    // MARK: Body
    
    var body: some View {
        LazyVStack(spacing: .extraSmall) {
            SHSection(
                text: transactionType.listTitle,
                color: .onBackgroundBody(colorScheme: colorScheme),
                font: .caption(.montserrat, .semiBold)
            )
            HStack {
                SHFlowLayout {
                    ForEach(categories) { category in
                        CategoryListItemView(category: category,)
                    }
                }
                Spacer()
            }
        }
    }
}
