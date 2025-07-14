//
//  CategoryDetailView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryDetailView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var model: Category
    private let id: String
    
    // MARK: Init
    
    init(id: String) {
        self.id = id
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView {
            if let category = model.categories.first(where: { $0.id == id }) {
                VStack {
                    Text(category.name)
                    Text(category.transactionType.title)
                    Text(category.createdAt.description)
                }
            } else {
                Text("Error: Category not found.")
            }
        }
    }
}
