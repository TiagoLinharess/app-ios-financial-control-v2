//
//  LoginWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

protocol LoginWorkerProtocol {
    func login() async throws -> LoginStep
}

final class LoginWorker: LoginWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let verifyProfileService: VerifyProfileServiceProtocol
    
    // MARK: Init
    
    init(verifyProfileService: VerifyProfileServiceProtocol = VerifyProfileService()) {
        self.verifyProfileService = verifyProfileService
    }
    
    // MARK: Public methods
    
    func login() async throws -> LoginStep {
        try await session.login()
        return try await verifyProfileService.execute() ? .existingUser : .newUser
    }
}
