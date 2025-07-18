//
//  Tag.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI

final class Tag {
    
    // MARK: Properties
    
    private let service: TagServiceProtocol
    
    @Published private(set) var tags: [TagViewModel] = []
    @Published private(set) var listState: TagViewState = .loading
    @Published private(set) var isFormLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(service: TagServiceProtocol = TagService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func read() async {
        listState = .loading
        do {
            let tags = try await service.read()
            self.tags = tags
            listState = tags.isEmpty ? .empty : .success
        } catch {
            listState = .failure((error as? FCError) ?? FCError.generic)
        }
    }
    
    func create(model: AddTagViewModel) async -> Bool {
        defer { isFormLoading = false }
        do {
            try validateName(name: model.name)
            isFormLoading = true
            try await service.create(model: model)
            await read()
            return true
        } catch {
            return handleFormError(error: error)
        }
    }
    
    func update(model: TagViewModel) async -> Bool {
        defer { isFormLoading = false }
        do {
            try validateName(name: model.name)
            isFormLoading = true
            try await service.update(model: model)
            await read()
            return true
        } catch {
            return handleFormError(error: error)
        }
    }
    
    func delete(id: String) async -> Bool {
        // TODO: Quando tiver transações, implementar regra de deleção
        defer { isFormLoading = false }
        do {
            isFormLoading = true
            try await service.delete(id: id)
            await read()
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
