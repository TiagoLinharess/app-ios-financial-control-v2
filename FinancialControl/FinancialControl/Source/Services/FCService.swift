//
//  FCService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 12/07/25.
//

import Foundation

open class FCService {
    
    // MARK: Properties
    
    let session: SessionSingletonProtocol
    
    // MARK: Init
    
    init(session: SessionSingletonProtocol = SessionSingleton.shared) {
        self.session = session
    }
    
    // MARK: Public methods
    
    func handleError(error: Error) async -> Error {
        let fcError: FCError = (error as? FCError) ?? FCError(value: error.localizedDescription)
        switch fcError {
        case .sessionExpired:
            return await handleSessionError()
        default:
            return fcError
        }
    }
    
    // MARK: Private methods
    
    func handleSessionError() async -> Error {
        do {
            try await session.remakeSession()
            return FCError.sessionExpired
        } catch {
            return error
        }
    }
}
