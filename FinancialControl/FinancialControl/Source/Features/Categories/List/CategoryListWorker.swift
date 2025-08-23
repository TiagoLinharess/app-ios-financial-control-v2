//
//  CategoryListWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

protocol CategoryListWorkerProtocol {
    func read() async throws -> [CategoryDataModel]
}

final class CategoryListWorker: CategoryListWorkerProtocol {
    
    // MARK: Properties
    
    private let service: ReadCategoriesServiceProtocol
    
    // MARK: Init
    
    init(service: ReadCategoriesServiceProtocol = ReadCategoriesService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func read() async throws -> [CategoryDataModel] {
        return try await service.read()
    }
}
