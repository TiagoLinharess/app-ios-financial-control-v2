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
    @State private var transactionType: TransactionType
    @State private var icon: SHIconType
    @State private var name: String
    @State private var presentIconSelector: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Category
    
    // MARK: Init
    
    init(category: CategoryViewModel? = nil) {
        self.id = category?.id
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
                    title: Localizable.Commons.create,
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: false,
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
    
    private func handlePresentIconSelector() {
        presentIconSelector = true
    }
    
    private func handleSubmit() {
        if id == nil {
            handleCreate()
        }
    }
    
    private func handleCreate() {
        Task {
            let addModel = AddCategoryViewModel(
                transactionType: transactionType,
                icon: icon,
                name: name
            )
            if await model.create(model: addModel) {
                router.pop()
            }
        }
    }
}
