//
//  Tag.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI

final class Tag: ObservableObject {
    
    // MARK: Properties
    
    private let service: TagServiceProtocol
    
    @Published private(set) var tags: [TagDataModel] = []
    @Published private(set) var isFormLoading: Bool = false
    @Published private(set) var isDeleteLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(service: TagServiceProtocol = TagService()) {
        self.service = service
    }
    
    // MARK: Public methods
    

    
    func create(model: AddTagDataModel) async -> Bool {
        defer { isFormLoading = false }
        do {
            try validateName(name: model.name)
            isFormLoading = true
            try await service.create(model: model)
            return true
        } catch {
            return handleFormError(error: error)
        }
    }
    
    func update(model: TagDataModel) async -> Bool {
        defer { isFormLoading = false }
        do {
            try validateName(name: model.name)
            isFormLoading = true
            try await service.update(model: model)
            return true
        } catch {
            return handleFormError(error: error)
        }
    }
    
    func delete(id: String) async -> Bool {
        // TODO: Quando tiver transações, implementar regra de deleção
        defer { isDeleteLoading = false }
        do {
            isDeleteLoading = true
            try await service.delete(id: id)
            return true
        } catch {
            return handleFormError(error: error)
        }
    }
    
    // MARK: Private methods
    
    private func handleFormError(error: Error) -> Bool {
        let message = ((error as? FCError) ?? FCError.generic).message
        toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
        return false
    }
    
    private func validateName(name: String) throws {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw FCError.custom(Localizable.Commons.emptyName)
        }
    }
}
