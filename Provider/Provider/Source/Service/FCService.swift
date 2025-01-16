//
//  FCService.swift
//  Provider
//
//  Created by Tiago Linhares on 16/01/25.
//

import SharpnezCloud
import SharpnezCore

open class FCService {
    
    // MARK: Properties
    
    public let worker: SHCloudWorkerProtocol
    
    // MARK: Init
    
    public required init(worker: SHCloudWorkerProtocol = SHCloudWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    public func handleError(_ error: Error) -> CoreError {
        if let error = error as? CoreError {
            return error
        } else if let error = error as? SHCloudError {
            return handleCloudError(error)
        }
        
        return CoreError.customError(ProviderLocalizable.Error.unknown)
    }
    
    public func handleCloudError(_ error: SHCloudError) -> CoreError {
        return switch error {
        case .genericError:
            CoreError.customError(ProviderLocalizable.Error.generic)
        case .httpError(let data, _):
            handleData(data)
        case .customError(let message):
            CoreError.customError(message)
        }
    }
    
    // MARK: Private methods
    
    private func handleData(_ data: Data) -> CoreError {
        let response = try? JSONDecoder().decode(DefaultErrorResponse.self, from: data)
        return CoreError.customError(response?.error ?? ProviderLocalizable.Error.generic)
    }
}
