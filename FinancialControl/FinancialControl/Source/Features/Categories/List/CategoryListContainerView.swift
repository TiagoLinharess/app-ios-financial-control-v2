//
//  CategoryListContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct CategoryListContainerView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var model: Category
    
    // MARK: Body
    
    public var body: some View {
        SHContainerView(title: Localizable.Modules.categories) {
            Group {
                switch model.listState {
                case .loading:
                    SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
                case .success:
                    CategorySectionListView()
                case .empty:
                    SHEmptyView(
                        title: Localizable.Categories.emptyStateTitle,
                        description: Localizable.Categories.emptyStateDescription,
                        icon: .add,
                        color: .onBackground(colorScheme: colorScheme),
                        onColor: .background(colorScheme: colorScheme),
                        action: handleAdd
                    )
                case .failure(let fCError):
                    SHFeedbackView(
                        type: .error,
                        title: Localizable.Categories.errorStateTitle,
                        description: fCError.message,
                        primaryButtonTitle: Localizable.Commons.tryAgain,
                        primaryAction: handleGetCategories
                    )
                }
            }
            .padding(.small)
        }
        .onAppear(perform: handleGetCategories)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: handleAdd) {
                    SHIcon(icon: .add)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                        .frame(width: .medium, height: .medium)
                }
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleAdd() {
        Task {
            await model.read()
        }
    }
    
    private func handleGetCategories() {
        Task(operation: model.read)
    }
}
