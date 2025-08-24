//
//  TagFormWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

protocol TagFormWorkerProtocol {
    func create(model: AddTagDataModel) async throws
    func update(model: TagDataModel) async throws
    func delete(id: String) async throws
}

final class TagFormWorker: TagFormWorkerProtocol {
    
    // MARK: Proeprties
    
    private let createService: CreateTagServiceProtocol
    private let updateService: UpdateTagServiceProtocol
    private let deleteService: DeleteTagServiceProtocol
    
    // MARK: Init
    
    init(
        createService: CreateTagServiceProtocol = CreateTagService(),
        updateService: UpdateTagServiceProtocol = UpdateTagService(),
        deleteService: DeleteTagServiceProtocol = DeleteTagService()
    ) {
        self.createService = createService
        self.updateService = updateService
        self.deleteService = deleteService
    }
    
    // MARK: Public methods
    
    func create(model: AddTagDataModel) async throws {
        try await createService.execute(model: model)
    }
    
    func update(model: TagDataModel) async throws {
        try await updateService.execute(model: model)
    }
    
    func delete(id: String) async throws {
        // TODO: Implementar o request de transações com a tag para deleção apenas quando não estiver transações
        try await deleteService.execute(id: id)
    }
}
