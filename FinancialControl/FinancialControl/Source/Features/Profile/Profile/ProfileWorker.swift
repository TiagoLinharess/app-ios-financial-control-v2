//
//  ProfileWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 20/09/25.
//

protocol ProfileWorkerProtocol {
    func loadProfile() async throws -> ProfileDataModel
}

final class ProfileWorker: ProfileWorkerProtocol {
    
    // MARK: Properties
    
    private let readProfileService: ReadProfileServiceProtocol
    
    // MARK: Init
    
    init(readProfileService: ReadProfileServiceProtocol = ReadProfileService()) {
        self.readProfileService = readProfileService
    }
    
    // MARK: Public methods
    
    func loadProfile() async throws -> ProfileDataModel {
        return try await readProfileService.execute()
    }
}
