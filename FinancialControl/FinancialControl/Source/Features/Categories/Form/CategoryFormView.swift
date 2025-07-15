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
    @State private var name: String
    @State private var transactionType: TransactionType
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: Init
    
    init(category: CategoryViewModel? = nil) {
        self.id = category?.id
        self.name = category?.name ?? ""
        self.transactionType = category?.transactionType ?? .income
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: handleTitle()) {
            VStack(spacing: .small) {
                Text("picker")
                SHTextField(
                    title: Localizable.Commons.name,
                    color: .onBackground(colorScheme: colorScheme),
                    font: .montserrat,
                    text: $name
                )
                Spacer()
                SHButton(
                    title: "criar",
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: false,
                    action: handleSubmit
                )
            }
            .padding(.small)
        }
    }
    
    // MARK: Private methods
    
    private func handleTitle() -> String {
        id == nil ? "Nova categoria" : "Editar categoria"
    }
    
    private func handleSubmit() {
        print("submited")
    }
}
