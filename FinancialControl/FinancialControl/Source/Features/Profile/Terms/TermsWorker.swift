//
//  TermsWorker.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 07/10/25.
//

protocol TermsWorkerProtocol {
    func readTerms() async throws -> TermsDataModel
}

final class TermsWorker: TermsWorkerProtocol {
    
    // MARK: Properties
    
    private let readTermsService: ReadTermsServiceProtocol
    
    // MARK: Init
    
    init(readTermsService: ReadTermsServiceProtocol = ReadTermsService()) {
        self.readTermsService = readTermsService
    }
    
    // MARK: Public methods
    
    func readTerms() async throws -> TermsDataModel {
        return try await readTermsService.execute()
    }
}
