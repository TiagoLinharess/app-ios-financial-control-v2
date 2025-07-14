//
//  CategoryListView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct CategoryListView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var model: Category = Category()
    @State private var toast: SHToastViewModel?
    @State private var categories: [CategoryViewModel] = []
    
    // MARK: Body
    
    public var body: some View {
        SHContainerView(title: "Categorias") {
            List {
                ForEach(categories) { category in
                    Text(category.name)
                        .configureWithSH(
                            color: .onBackground(colorScheme: colorScheme),
                            font: .body(.poppins, .regular)
                        )
                }
            }
        }
        .onAppear(perform: handleGetCategories)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: handleAdd) {
                    SHIcon(icon: .menu)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                        .frame(width: .medium, height: .medium)
                }
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleGetCategories() {
        Task {
            do {
                categories = try await model.read()
            } catch {
                var message: String = error.localizedDescription
                if let fcError = error as? FCError {
                    message = fcError.message
                }
                
                toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            }
        }
    }
    
    private func handleAdd() {
        Task {
            do {
                try await model.create(model: AddCategoryViewModel(
                    transactionType: .income,
                    name: "teste"
                ))
                handleGetCategories()
            } catch {
                var message: String = error.localizedDescription
                if let fcError = error as? FCError {
                    message = fcError.message
                }
                
                toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            }
        }
    }
}
