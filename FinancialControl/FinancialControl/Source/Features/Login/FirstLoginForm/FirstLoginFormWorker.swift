//
//  FirstLoginFormWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

protocol FirstLoginFormWorkerProtocol {
    func execute(model: AddProfileDataModel) async throws -> FirstLoginStep
}

final class FirstLoginFormWorker: FirstLoginFormWorkerProtocol {
    
    // MARK: Properties
    
    private let readProfileService: ReadProfileServiceProtocol
    private let createProfileService: CreateProfileServiceProtocol
    
    // MARK: Init
    
    init(
        readProfileService: ReadProfileServiceProtocol = ReadProfileService(),
        createProfileService: CreateProfileServiceProtocol = CreateProfileService(),
    ) {
        self.readProfileService = readProfileService
        self.createProfileService = createProfileService
    }
    
    // MARK: Public methods
    
    func execute(model: AddProfileDataModel) async throws -> FirstLoginStep {
        if let profile = try await readProfileService.execute() {
            return .alreadyExists
        }
        
        try await createProfileService.execute(model: model)
        return .created
    }
}
