//
//  Category.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import Combine
import Foundation

final class Category: ObservableObject {
    
    // MARK: Properties
    
    private let service: CategoryServiceProtocol
    
    @Published private(set) var categories: [CategoryViewModel] = []
    @Published private(set) var listState: CategoryViewState = .loading
    
    // MARK: Init
    
    init(service: CategoryServiceProtocol = CategoryService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func read() async {
        listState = .loading
        do {
            let categories = try await service.read()
            self.categories = categories
            listState = categories.isEmpty ? .empty : .success
        } catch {
            listState = .failure((error as? FCError) ?? FCError.generic)
        }
    }
    
    func create(model: AddCategoryViewModel) async throws {
        try await service.create(model: model)
    }
    
    func update(model: CategoryViewModel) async throws {
        try await service.update(model: model)
    }
    
    func delete(id: String) async throws {
        try await service.delete(id: id)
    }
}
