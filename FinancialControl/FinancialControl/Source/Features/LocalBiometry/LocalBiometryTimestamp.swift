//
//  LocalBiometryTimestamp.swift
//  FinancialControl
//
//  Created by Assistente on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class LocalBiometryTimestamp {
    @Attribute(.unique) var id: UUID
    var date: Date
    
    init(date: Date) {
        self.id = UUID()
        self.date = date
    }
    
    func needValidation() -> Bool {
        let timeInterval = Date().timeIntervalSince(date) / 60
        return timeInterval > 15
    }
}
