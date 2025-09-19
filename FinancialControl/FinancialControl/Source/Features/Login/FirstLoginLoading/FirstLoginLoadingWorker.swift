//
//  FirstLoginLoadingWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

protocol FirstLoginLoadingWorkerProtocol {
    func execute() async throws
    func logout() async throws
}

final class FirstLoginLoadingWorker: FirstLoginLoadingWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let createCategoryService: CreateCategoryServiceProtocol
    private let createTagService: CreateTagServiceProtocol
    
    // MARK: Init
    
    init(
        createCategoryService: CreateCategoryServiceProtocol = CreateCategoryService(),
        createTagService: CreateTagServiceProtocol = CreateTagService()
    ) {
        self.createCategoryService = createCategoryService
        self.createTagService = createTagService
    }
    
    // MARK: Public methods
    
    func execute() async throws {
        try await createCategoryService.executeBasics()
        try await createTagService.executeBasics()
    }
    
    func logout() async throws {
        try await session.logout()
    }
}
