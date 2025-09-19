//
//  HomeWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

protocol HomeWorkerProtocol {
    func loadHome() async throws -> HomeDataModel
    func logout() async throws
}

final class HomeWorker: HomeWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let readProfileService: ReadProfileServiceProtocol
    
    // MARK: Init
    
    init(readProfileService: ReadProfileServiceProtocol = ReadProfileService()) {
        self.readProfileService = readProfileService
    }
    
    // MARK: Public methods
    
    func loadHome() async throws -> HomeDataModel {
        let profileDataModel = try await readProfileService.execute()
        
        return HomeDataModel(profile: profileDataModel)
    }
    
    func logout() async throws {
        try await session.logout()
    }
}
