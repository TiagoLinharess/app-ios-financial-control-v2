//
//  ProfileSettingsWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 01/10/25.
//

protocol ProfileSettingsWorkerProtocol {
    func logout() async throws
}

final class ProfileSettingsWorker: ProfileSettingsWorkerProtocol {
    
    // MARK: Proeprties
    
    @FCSession private var session: any FCSessionModelProtocol
    
    // MARK: Public methods
    
    func logout() async throws {
        try await session.logout()
    }
}
