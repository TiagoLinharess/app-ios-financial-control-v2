//
//  TermsAgreementWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 08/10/25.
//

protocol TermsAgreementWorkerProtocol {
    func readTerms() async throws -> TermsDataModel
    func logout() async throws
}

final class TermsAgreementWorker: TermsAgreementWorkerProtocol {
    
    // MARK: Properties
    
    @FCSession private var session: any FCSessionModelProtocol
    private let readTermsService: ReadTermsServiceProtocol
    
    // MARK: Init
    
    init(readTermsService: ReadTermsServiceProtocol = ReadTermsService()) {
        self.readTermsService = readTermsService
    }
    
    // MARK: Public methods
    
    func readTerms() async throws -> TermsDataModel {
        return try await readTermsService.execute()
    }
    
    func logout() async throws {
        try await session.logout()
    }
}
