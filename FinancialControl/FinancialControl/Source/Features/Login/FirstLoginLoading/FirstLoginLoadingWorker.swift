//
//  FirstLoginLoadingWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

protocol FirstLoginLoadingWorkerProtocol {
    func execute(model: AddProfileDataModel) async throws
    func logout() async throws
}

final class FirstLoginLoadingWorker: FirstLoginLoadingWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let verifyProfileService: VerifyProfileServiceProtocol
    private let createProfileService: CreateProfileServiceProtocol
    private let createCategoryService: CreateCategoryServiceProtocol
    private let createTagService: CreateTagServiceProtocol
    
    // MARK: Init
    
    init(
        verifyProfileService: VerifyProfileServiceProtocol = VerifyProfileService(),
        createProfileService: CreateProfileServiceProtocol = CreateProfileService(),
        createCategoryService: CreateCategoryServiceProtocol = CreateCategoryService(),
        createTagService: CreateTagServiceProtocol = CreateTagService()
    ) {
        self.verifyProfileService = verifyProfileService
        self.createProfileService = createProfileService
        self.createCategoryService = createCategoryService
        self.createTagService = createTagService
    }
    
    // MARK: Public methods
    
    func execute(model: AddProfileDataModel) async throws {
        if try await verifyProfileService.execute() {
            return
        }
        
        try await createProfileService.execute(model: model)
        try await createCategoryService.executeBasics()
        try await createTagService.executeBasics()
    }
    
    func logout() async throws {
        try await session.logout()
    }
}
