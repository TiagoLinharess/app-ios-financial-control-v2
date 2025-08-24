//
//  TagListWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

protocol TagListWorkerProtocol {
    func read() async throws -> [TagDataModel]
}

final class TagListWorker: TagListWorkerProtocol {
    
    // MARK: Properties
    
    private let service: ReadTagsServiceProtocol
    
    // MARK: Init
    
    init(service: ReadTagsServiceProtocol = ReadTagsService()) {
        self.service = service
    }
    
    // MARK: Properties
    
    func read() async throws -> [TagDataModel] {
        return try await service.execute()
    }
}
