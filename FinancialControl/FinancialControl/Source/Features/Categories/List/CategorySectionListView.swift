//
//  CategorySectionListView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategorySectionListView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var model: Category
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: .small) {
                ForEach(TransactionType.allCases, id: \.self) { transactionType in
                    let filtered = model.categories.filter { $0.transactionType == transactionType }
                    if !filtered.isEmpty {
                        CategoryListView(transactionType: transactionType, categories: filtered)
                    }
                }
            }
            .padding(.small)
        }
    }
}
