//
//  TagFormViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

import Combine
import SharpnezDesignSystemSwiftUI
import SwiftUI

protocol TagFormViewModelProtocol: ObservableObject {
    var id: String? { get }
    var textColor: Color { get set }
    var backgroundColor: Color { get set }
    var name: String { get set }
    var deleteAlertPresented: Bool { get set }
    var isFormLoading: Bool { get set }
    var isDeleteLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    var title: String { get }
    var buttonTitle: String { get }
    func handleTapDelete()
    func submit() async -> Bool
    func delete() async -> Bool
}

final class TagFormViewModel: TagFormViewModelProtocol {
    
    // MARK: Properties
    
    private let service: TagServiceProtocol
    private let createdAt: Date?
    let id: String?
    @Published var textColor: Color
    @Published var backgroundColor: Color
    @Published var name: String
    @Published var deleteAlertPresented: Bool = false
    @Published var isFormLoading: Bool = false
    @Published var isDeleteLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    var title: String {
        id == nil ? Localizable.Tags.new : Localizable.Tags.edit
    }
    
    var buttonTitle: String {
        id == nil ? Localizable.Commons.create : Localizable.Commons.update
    }
    
    // MARK: Init
    
    init(model: TagDataModel?, service: TagServiceProtocol = TagService()) {
        self.service = service
        self.id = model?.id
        self.createdAt = model?.createdAt
        self.textColor = model?.textColor ?? .onBrand()
        self.backgroundColor = model?.backgroundColor ?? .brand()
        self.name = model?.name ?? String()
    }
    
    // MARK: Public methods
    
    func handleTapDelete() {
        deleteAlertPresented = true
    }
    
    func submit() async -> Bool {
        defer { isFormLoading = false }
        isFormLoading = true
        if let id, let createdAt {
            return await update(id: id, createdAt: createdAt)
        } else {
            return await create()
        }
    }
    
    func delete() async -> Bool {
        defer { isDeleteLoading = false }
        isDeleteLoading = true
        do {
            guard let id else { throw FCError.generic }
            try await service.delete(id: id)
            return true
        } catch {
            handleFormError(error: error)
            return false
        }
    }
    
    // MARK: Private methods

    func create() async -> Bool {
        do {
            let model = AddTagDataModel(
                backgroundColor: backgroundColor,
                textColor: textColor,
                name: name
            )
            try await service.create(model: model)
            return true
        } catch {
            handleFormError(error: error)
            return false
        }
    }
    
    func update(id: String, createdAt: Date) async -> Bool {
        defer { isFormLoading = false }
        isFormLoading = true
        do {
            let model = TagDataModel(
                id: id,
                backgroundColor: backgroundColor,
                textColor: textColor,
                name: name,
                createdAt: createdAt
            )
            try await service.update(model: model)
            return true
        } catch {
            handleFormError(error: error)
            return false
        }
    }
    
    // MARK: Private methods
    
    private func handleFormError(error: Error) {
        let message = ((error as? FCError) ?? FCError.generic).message
        toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
    }
}
