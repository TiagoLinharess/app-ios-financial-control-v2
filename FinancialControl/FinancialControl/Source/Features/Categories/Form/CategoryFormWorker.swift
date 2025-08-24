//
//  CategoryFormWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

protocol CategoryFormWorkerProtocol {
    func create(model: AddCategoryDataModel) async throws
    func update(model: CategoryDataModel) async throws
    func delete(id: String) async throws
}

final class CategoryFormWorker: CategoryFormWorkerProtocol {
    
    // MARK: Proeprties
    
    private let createService: CreateCategoryServiceProtocol
    private let updateService: UpdateCategoryServiceProtocol
    private let deleteService: DeleteCategoryServiceProtocol
    
    // MARK: Init
    
    init(
        createService: CreateCategoryServiceProtocol = CreateCategoryService(),
        updateService: UpdateCategoryServiceProtocol = UpdateCategoryService(),
        deleteService: DeleteCategoryServiceProtocol = DeleteCategoryService()
    ) {
        self.createService = createService
        self.updateService = updateService
        self.deleteService = deleteService
    }
    
    // MARK: Public methods
    
    func create(model: AddCategoryDataModel) async throws {
        try await createService.execute(model: model)
    }
    
    func update(model: CategoryDataModel) async throws {
        try await updateService.execute(model: model)
    }
    
    func delete(id: String) async throws {
        // TODO: Implementar o request de transações com a categoria para deleção apenas quando não estiver transações
        try await deleteService.execute(id: id)
    }
}
