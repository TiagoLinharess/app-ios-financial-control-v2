//
//  CategoryDetailView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezCore
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryDetailView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var model: Category
    @EnvironmentObject private var router: Router
    @State private var deleteAlertPresented: Bool = false
    private let id: String
    
    // MARK: Init
    
    init(id: String) {
        self.id = id
    }
    
    // MARK: Body
    
    var body: some View {
        if let category = model.categories.first(where: { $0.id == id }) {
            SHContainerView {
                VStack(alignment: .leading, spacing: .small) {
                    HStack(spacing: .extraSmall) {
                        SHIcon(icon: category.icon)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                            .frame(width: .big, height: .big)
                        Text(category.name)
                            .configureWithSH(
                                color: .onBackground(colorScheme: colorScheme),
                                font: .title3(.montserrat, .regular)
                            )
                    }
                    VStack(alignment: .leading, spacing: .zero) {
                        Text(category.transactionType.title)
                            .configureWithSH(
                                color: .onBackgroundWeak(colorScheme: colorScheme),
                                font: .caption(.montserrat, .regular)
                            )
                        Text(Localizable.Commons.createdAt(category.createdAt.toString() ?? category.createdAt.description))
                        .configureWithSH(
                            color: .onBackgroundWeak(colorScheme: colorScheme),
                            font: .caption(.montserrat, .regular)
                        )
                    }
                    .padding(.leading, .xxBig)
                    Spacer()
                    SHButton(
                        title: Localizable.Commons.delete,
                        style:.primary(
                            .error(colorScheme: colorScheme),
                            .onError(colorScheme: colorScheme)
                        ),
                        font: .montserrat,
                        isLoading: model.isFormLoading,
                        action: handleTapDelete
                    )
                }
                .padding(.small)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            handleEdit(category: category)
                        } label: {
                            SHIcon(icon: .edit)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                                .frame(width: .medium, height: .medium)
                        }
                    }
                }
                .alert(isPresented: $deleteAlertPresented) {
                    Alert(
                        title: Text(Localizable.Categories.deleteTitle),
                        message: Text(Localizable.Categories.deleteDescription),
                        primaryButton: .destructive(
                            Text(Localizable.Commons.delete),
                            action: handleDeleteCategory
                        ),
                        secondaryButton: .default(Text(Localizable.Commons.goBack))
                    )
                }
                
            }
        } else {
            SHFeedbackView(
                type: .error,
                title: Localizable.Categories.errorStateTitle,
                description: Localizable.Error.generic,
                primaryButtonTitle: Localizable.Commons.goBack,
                primaryAction: handleGoBack
            )
        }
    }
    
    // MARK: Private methods
    
    private func handleTapDelete() {
        deleteAlertPresented = true
    }
    
    private func handleDeleteCategory() {
        Task {
            if await model.delete(id: id) {
                handleGoBack()
            }
        }
    }
    
    private func handleEdit(category: CategoryDataModel) {
        router.push(.categoryForm(category))
    }
    
    private func handleGoBack() {
        router.pop()
    }
}
