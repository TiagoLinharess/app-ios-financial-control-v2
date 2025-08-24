//
//  CategoryListContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryListContainerView<ViewModel: CategoryListViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    public var body: some View {
        SHContainerView(title: Localizable.Modules.categories) {
            switch viewModel.viewState {
            case .loading:
                SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
            case .success:
                CategorySectionListView(categories: viewModel.categories)
                    .refreshable(action: handleGetCategories)
            case .empty:
                emptyStateView
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
        .onAppear(perform: handleGetCategories)
    }
    
    @ViewBuilder
    private var emptyStateView: some View {
        ScrollView(.vertical) {
            SHEmptyView(
                title: Localizable.Categories.emptyStateTitle,
                description: Localizable.Categories.emptyStateDescription,
                icon: .add,
                color: .onBackground(colorScheme: colorScheme),
                onColor: .background(colorScheme: colorScheme),
                action: handleAdd
            )
        }
        .refreshable(action: handleGetCategories)
    }
    
    // MARK: Private methods
    
    private func handleAdd() {
        router.push(.categoryForm())
    }
    
    private func handleGetCategories() {
        Task {
            await viewModel.read()
        }
    }
}
