//
//  JSONEncoder+Extensions.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 12/07/25.
//

import Foundation

extension JSONEncoder {
    nonisolated func toDictionary(model: Encodable) throws -> [String: Any] {
        guard let data = try? encode(model),
              let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { throw FCError.parseError }
        
        return dict
    }
}
