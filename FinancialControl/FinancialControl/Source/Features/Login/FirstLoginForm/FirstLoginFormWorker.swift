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
    
    private let verifyProfileService: VerifyProfileServiceProtocol
    private let createProfileService: CreateProfileServiceProtocol
    
    // MARK: Init
    
    init(
        verifyProfileService: VerifyProfileServiceProtocol = VerifyProfileService(),
        createProfileService: CreateProfileServiceProtocol = CreateProfileService(),
    ) {
        self.verifyProfileService = verifyProfileService
        self.createProfileService = createProfileService
    }
    
    // MARK: Public methods
    
    func execute(model: AddProfileDataModel) async throws -> FirstLoginStep {
        if try await verifyProfileService.execute() {
            return .alreadyExists
        }
        
        try await createProfileService.execute(model: model)
        return .created
    }
}
