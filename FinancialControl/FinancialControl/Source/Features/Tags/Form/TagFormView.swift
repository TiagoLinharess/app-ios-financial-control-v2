//
//  TagFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagFormView: View {
    
    // MARK: Properties
    
    private let id: String?
    private let createdAt: Date?
    @State private var textColor: Color
    @State private var backgroundColor: Color
    @State private var name: String
    @State private var deleteAlertPresented: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Tag
    
    // MARK: Init
    
    init(tag: TagViewModel? = nil) {
        self.id = tag?.id
        self.createdAt = tag?.createdAt
        self.backgroundColor = tag?.backgroundColor ?? .brand()
        self.textColor = tag?.textColor ?? .onBrand()
        self.name = tag?.name ?? String()
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: handleTitle()) {
            VStack(spacing: .medium) {
                ScrollView(.vertical) {
                    VStack(spacing: .medium) {
                        TagItemView(
                            name: name,
                            backgroundColor: backgroundColor,
                            textColor: textColor
                        )
                        SHTextField(
                            title: Localizable.Commons.name,
                            color: .onBackground(colorScheme: colorScheme),
                            font: .montserrat,
                            text: $name
                        )
                        ColorPicker(selection: $backgroundColor) {
                            Text(Localizable.Commons.selectBackgroundColor)
                                .configureWithSH(
                                    color: .onBackground(colorScheme: colorScheme),
                                    font: .body(.montserrat, .medium)
                                )
                        }
                        ColorPicker(selection: $textColor) {
                            Text(Localizable.Commons.selectTextColor)
                                .configureWithSH(
                                    color: .onBackground(colorScheme: colorScheme),
                                    font: .body(.montserrat, .medium)
                                )
                        }
                    }
                    .padding(.small)
                }
                Spacer()
                VStack(spacing: .small) {
                    SHButton(
                        title: handleButtonTitle(),
                        style: .primary(
                            .brand(colorScheme: colorScheme),
                            .onBrand(colorScheme: colorScheme)
                        ),
                        font: .montserrat,
                        isLoading: model.isFormLoading,
                        isDisabled: model.isDeleteLoading,
                        action: handleSubmit
                    )
                    if id != nil {
                        SHButton(
                            title: Localizable.Commons.delete,
                            style: .primary(
                                .error(colorScheme: colorScheme),
                                .onError(colorScheme: colorScheme)
                            ),
                            font: .montserrat,
                            isLoading: model.isDeleteLoading,
                            isDisabled: model.isFormLoading,
                            action: handleTapDelete
                        )
                    }
                }
                .padding(.small)
            }
        }
        .toastView(toast: $model.toast)
        .onTapGesture(perform: closeKeyboard)
        .alert(isPresented: $deleteAlertPresented) {
            Alert(
                title: Text(Localizable.Tags.deleteTitle),
                message: Text(Localizable.Tags.deleteDescription),
                primaryButton: .destructive(
                    Text(Localizable.Commons.delete),
                    action: handleDeleteCategory
                ),
                secondaryButton: .default(Text(Localizable.Commons.goBack))
            )
        }
    }
    
    // MARK: Private methods
    
    private func handleTitle() -> String {
        id == nil ? Localizable.Tags.new : Localizable.Tags.edit
    }
    
    private func handleButtonTitle() -> String {
        id == nil ? Localizable.Commons.create : Localizable.Commons.update
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
            let addModel = AddTagViewModel(
                backgroundColor: backgroundColor,
                textColor: textColor,
                name: name
            )
            if await model.create(model: addModel) {
                router.pop()
            }
        }
    }
    
    private func handleUpdate(id: String, createdAt: Date) {
        Task {
            let editModel = TagViewModel(
                id: id,
                backgroundColor: backgroundColor,
                textColor: textColor,
                name: name,
                createdAt: createdAt
            )
            if await model.update(model: editModel) {
                router.pop()
            }
        }
    }
    
    private func handleTapDelete() {
        deleteAlertPresented = true
    }
    
    private func handleDeleteCategory() {
        Task {
            guard let id else { return }
            if await model.delete(id: id) {
                router.pop()
            }
        }
    }
}
