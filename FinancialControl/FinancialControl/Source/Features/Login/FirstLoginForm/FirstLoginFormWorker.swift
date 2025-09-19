//
//  FirstLoginFormWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

enum FirstLoginWorkerResponse {
    case created
    case alreadyExists
}

protocol FirstLoginFormWorkerProtocol {
    func execute(model: AddProfileDataModel) async throws -> FirstLoginWorkerResponse
}

final class FirstLoginFormWorker: FirstLoginFormWorkerProtocol {
    
    // MARK: Properties
    
    private let readProfileService: ReadProfileServiceProtocol
    private let createProfileService: CreateProfileServiceProtocol
    private let createCategoryService: CreateCategoryServiceProtocol
    private let createTagService: CreateTagServiceProtocol
    
    // MARK: Init
    
    init(
        readProfileService: ReadProfileServiceProtocol = ReadProfileService(),
        createProfileService: CreateProfileServiceProtocol = CreateProfileService(),
        createCategoryService: CreateCategoryServiceProtocol = CreateCategoryService(),
        createTagService: CreateTagServiceProtocol = CreateTagService()
    ) {
        self.readProfileService = readProfileService
        self.createProfileService = createProfileService
        self.createCategoryService = createCategoryService
        self.createTagService = createTagService
    }
    
    // MARK: Public methods
    
    func execute(model: AddProfileDataModel) async throws -> FirstLoginWorkerResponse {
        if let profile = try await readProfileService.execute() {
            return .alreadyExists
        }
        
        try await createProfileService.execute(model: model)
        try await createCategoryService.executeBasics()
        try await createTagService.executeBasics()
        
        return .created
    }
}
