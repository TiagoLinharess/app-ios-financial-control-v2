//
//  ProfileSettingsWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 01/10/25.
//

protocol ProfileSettingsWorkerProtocol {
    func logout() async throws
    func delete() async throws
}

final class ProfileSettingsWorker: ProfileSettingsWorkerProtocol {
    
    // MARK: Proeprties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let readProfileService: ReadProfileServiceProtocol
    private let deleteProfileService: DeleteProfileServiceProtocol
    
    
    init(
        readProfileService: ReadProfileServiceProtocol = ReadProfileService(),
        deleteProfileService: DeleteProfileServiceProtocol = DeleteProfileService()
    ) {
        self.readProfileService = readProfileService
        self.deleteProfileService = deleteProfileService
    }
    
    // MARK: Public methods
    
    func logout() async throws {
        try await session.logout()
    }
    
    func delete() async throws {
        let model = try await readProfileService.execute()
        try await session.reauthenticate()
        try await deleteProfileService.execute(id: model.id)
    }
}
