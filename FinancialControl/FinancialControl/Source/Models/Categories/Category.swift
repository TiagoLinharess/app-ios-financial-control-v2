//
//  Category.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import Combine

final class Category: ObservableObject {
    
    // MARK: Properties
    
    private let service: CategoryServiceProtocol
    
    // MARK: Init
    
    init(service: CategoryServiceProtocol = CategoryService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func read() async throws -> [CategoryViewModel] {
        return try await service.read()
    }
    
    func create(model: CategoryViewModel) async throws {
        try await service.create(model: model)
    }
    
    func update(model: CategoryViewModel) async throws {
        try await service.update(model: model)
    }
    
    func delete(id: String) async throws {
        try await service.delete(id: id)
    }
}
