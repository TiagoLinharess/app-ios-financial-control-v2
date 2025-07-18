//
//  TagListContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

// TODO: ScrollView no erro quebra o layout
struct TagListContainerView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Tag
    
    // MARK: Body
    
    var body: some View {
        // TODO: Localizable
        SHContainerView(title: "Tags") {
            switch model.listState {
            case .loading:
                SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
            case .success:
                Text("list")
            case .empty:
                emptyStateView
            case .failure(let fCError):
                SHFeedbackView(
                    type: .error,
                    title: Localizable.Categories.errorStateTitle,
                    description: fCError.message,
                    primaryButtonTitle: Localizable.Commons.tryAgain,
                    primaryAction: handleGetTags
                )
            }
        }
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
        .refreshable(action: handleGetTags)
    }
    
    // MARK: Private methods
    
    private func handleAdd() {
    }
    
    private func handleGetTags() {
        Task(operation: model.read)
    }
}
