//
//  CategoryFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryFormView: View {
    
    // MARK: Properties
    
    private let id: String?
    private let createdAt: Date?
    @State private var transactionType: TransactionType
    @State private var icon: SHIconType
    @State private var name: String
    @State private var presentIconSelector: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Category
    
    // MARK: Init
    
    init(category: CategoryDataModel? = nil) {
        self.id = category?.id
        self.createdAt = category?.createdAt
        self.transactionType = category?.transactionType ?? .income
        self.icon = .coin
        self.name = category?.name ?? String()
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: handleTitle()) {
            VStack(spacing: .medium) {
                ScrollView(.vertical) {
                    VStack(spacing: .medium) {
                        CategoryItemView(icon: icon, name: name)
                        TransactionTypeSelectorView(selectedTransactionType: $transactionType)
                        HStack {
                            IconSelectorButton(
                                icon: icon,
                                color: .onBackground(colorScheme: colorScheme),
                                action: handlePresentIconSelector
                            )
                            Spacer()
                        }
                        SHTextField(
                            title: Localizable.Commons.name,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            text: $name
                        )
                    }
                    .padding(.small)
                }
                Spacer()
                SHButton(
                    title: handleButtonTitle(),
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: model.isFormLoading,
                    action: handleSubmit
                )
                .padding(.small)
            }
        }
        .sheet(isPresented: $presentIconSelector) {
            IconSelectorView(selectedIcon: $icon, isPresented: $presentIconSelector)
        }
        .toastView(toast: $model.toast)
        .onTapGesture(perform: closeKeyboard)
    }
    
    // MARK: Private methods
    
    private func handleTitle() -> String {
        id == nil ? Localizable.Categories.new : Localizable.Categories.edit
    }
    
    private func handleButtonTitle() -> String {
        id == nil ? Localizable.Commons.create : Localizable.Commons.update
    }
    
    private func handlePresentIconSelector() {
        presentIconSelector = true
    }
    
    private func handleSubmit() {
        if let id, let createdAt {
            handleUpdate(id: id, createdAt: createdAt)
        } else {
            handleCreate()
        }
    }
    
    private func handleCreate() {
        Task {
            let addModel = AddCategoryDataModel(
                transactionType: transactionType,
                icon: icon,
                name: name
            )
            if await model.create(model: addModel) {
                router.pop()
            }
        }
    }
    
    private func handleUpdate(id: String, createdAt: Date) {
        Task {
            let editModel = CategoryDataModel(
                id: id,
                transactionType: transactionType,
                icon: icon,
                name: name,
                createdAt: createdAt
            )
            if await model.update(model: editModel) {
                router.pop()
            }
        }
    }
}
