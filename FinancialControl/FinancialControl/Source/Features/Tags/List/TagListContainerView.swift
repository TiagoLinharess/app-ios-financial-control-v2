//
//  TagListContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagListContainerView<ViewModel: TagListViewModelProtocol>: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ViewModel
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: Localizable.Modules.tags) {
            switch viewModel.viewState {
            case .loading:
                SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
            case .success:
                TagListView(tags: viewModel.tags)
                    .refreshable(action: handleGetTags)
            case .empty:
                emptyStateView
            case .failure(let fCError):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Tags.errorStateTitle,
                    description: fCError.message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: handleGetTags
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
        .onAppear(perform: handleGetTags)
    }
    
    @ViewBuilder
    private var emptyStateView: some View {
        ScrollView(.vertical) {
            SHEmptyView(
                title: Localizable.Tags.emptyStateTitle,
                description: Localizable.Tags.emptyStateDescription,
                icon: .add,
                color: .onBackground(colorScheme: colorScheme),
                onColor: .background(colorScheme: colorScheme),
                action: handleAdd
            )
        }
        .refreshable(action: handleGetTags)
    }
    
    // MARK: Private methods
    
    private func handleAdd() {
        router.push(.tagForm())
    }
    
    private func handleGetTags() {
        Task {
            await viewModel.read()
        }
    }
}
