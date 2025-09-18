//
//  LoginWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

protocol LoginWorkerProtocol {
    func login() async throws -> ProfileDataModel?
}

final class LoginWorker: LoginWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let readService: ReadProfileServiceProtocol
    
    // MARK: Init
    
    init(readService: ReadProfileServiceProtocol = ReadProfileService()) {
        self.readService = readService
    }
    
    // MARK: Public methods
    
    func login() async throws -> ProfileDataModel? {
        try await session.login()
        return try await readService.execute()
    }
}
