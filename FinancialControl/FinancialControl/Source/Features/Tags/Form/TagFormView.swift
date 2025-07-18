//
//  TagFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

// TODO: Localizable
struct TagFormView: View {
    
    // MARK: Properties
    
    private let id: String?
    private let createdAt: Date?
    @State private var color: Color
    @State private var name: String
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var model: Tag
    
    init(tag: TagViewModel? = nil) {
        self.id = tag?.id
        self.createdAt = tag?.createdAt
        self.color = tag?.color ?? .blue
        self.name = tag?.name ?? String()
    }
    
    // MARK: Body
    
    var body: some View {
        SHContainerView(title: handleTitle()) {
            VStack(spacing: .medium) {
                ScrollView(.vertical) {
                    VStack(spacing: .medium) {
                        ColorPicker(selection: $color) {
                            Text("Selecione a cor")
                                .configureWithSH(
                                    color: .onBackground(colorScheme: colorScheme),
                                    font: .body(.montserrat, .regular)
                                )
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
                    isLoading: model.isFormLoading,
                    action: handleSubmit
                )
                .padding(.small)
            }
        }
        .toastView(toast: $model.toast)
        .onTapGesture(perform: closeKeyboard)
    }
    
    // MARK: Private methods
    
    private func handleTitle() -> String {
        id == nil ? "Nova Tag" : "Editar Tag"
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
            let addModel = AddTagViewModel(color: color, name: name)
            if await model.create(model: addModel) {
                router.pop()
            }
        }
    }
    
    private func handleUpdate(id: String, createdAt: Date) {
        Task {
            let editModel = TagViewModel(
                id: id,
                color: color,
                name: name,
                createdAt: createdAt
            )
            if await model.update(model: editModel) {
                router.pop()
            }
        }
    }
}
