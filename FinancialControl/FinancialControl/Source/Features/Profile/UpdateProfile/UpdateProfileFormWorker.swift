//
//  UpdateProfileFormWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 03/10/25.
//

protocol UpdateProfileFormWorkerProtocol {
    func read() async throws -> ProfileDataModel
    func update(model: ProfileDataModel) async throws
}

final class UpdateProfileFormWorker: UpdateProfileFormWorkerProtocol {
    
    // MARK: Proeprties
    
    private let readProfileService: ReadProfileServiceProtocol
    private let updateProfileService: UpdateProfileServiceProtocol
    
    init(
        readProfileService: ReadProfileServiceProtocol = ReadProfileService(),
        updateProfileService: UpdateProfileServiceProtocol = UpdateProfileService()
    ) {
        self.readProfileService = readProfileService
        self.updateProfileService = updateProfileService
    }
    
    // MARK: Public methods
    
    func read() async throws -> ProfileDataModel {
        return try await readProfileService.execute()
    }
    
    func update(model: ProfileDataModel) async throws {
        try await updateProfileService.execute(model: model)
    }
}
