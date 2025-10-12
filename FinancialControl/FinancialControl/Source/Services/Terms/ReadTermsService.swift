//
//  ReadTermsService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/10/25.
//

import FirebaseAuth

protocol ReadTermsServiceProtocol {
    func execute() async throws -> TermsDataModel
}

final class ReadTermsService: FCService, ReadTermsServiceProtocol {
    
    // MARK: Properties
    
    private let repository: TermsRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository: TermsRepositoryProtocol = TermsRepository(),
        auth: Auth = .auth(),
    ) {
        self.repository = repository
        self.auth = auth
    }
    
    // MARK: Public methods
    
    func execute() async throws -> TermsDataModel {
        do {
            let response = try await repository.read()
            let showPTTerms = Locale.current.identifier == Constants.Locale.brazil
            let stringTerms = showPTTerms ? response.termsPT : response.termsEN
            guard let terms = URL(string: stringTerms) else { throw FCError.parseError }
            return TermsDataModel(terms: terms)
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
