//
//  TagListContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagListContainerView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Tag
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: Localizable.Modules.tags) {
            switch model.listState {
            case .loading:
                SHLoading(style: .medium, color: .onBackground(colorScheme: colorScheme))
            case .success:
                TagListView()
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
        Task(operation: model.read)
    }
}
