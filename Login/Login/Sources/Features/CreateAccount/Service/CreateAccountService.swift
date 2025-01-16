//
//  CreateAccountService.swift
//  Login
//
//  Created by Tiago Linhares on 15/01/25.
//

import Provider
import SharpnezCloud
import SharpnezCore

protocol CreateAccountServiceProtocol {
    func submit(_ model: CreateAccountModel) async throws
}

final class CreateAccountService: FCService, CreateAccountServiceProtocol {
    
    // MARK: Public methods
    
    func submit(_ model: CreateAccountModel) async throws {
        let requestModel = CreateAccountRequestModel(from: model)
        let request = SHCloudRequest(
            method: .post,
            endpoint: LoginEndpoints.createAccount.rawValue,
            headers: Headers.unloggedHeader,
            data: requestModel
        )
        
        do {
            let response = try await worker.perform(DefaultSuccessResponse.self, request: request)
            try handleSuccess(response)
        } catch {
            throw handleError(error)
        }
    }
    
    // MARK: Private methods
    
    private func handleSuccess(_ response: DefaultSuccessResponse) throws {
        if !response.success {
            throw CoreError.customError("O e-mail enviado já existe.")
        }
    }
}
