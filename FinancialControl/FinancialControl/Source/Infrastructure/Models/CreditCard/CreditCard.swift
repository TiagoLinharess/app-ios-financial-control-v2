//
//  CreditCard.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class CreditCard {
    
    @Attribute(.unique) var id: UUID
    var name: String
    var firstFourDigits: String
    var limit: Double
    var closeDay: Int
    var expireDay: Int
    
    init(
        name: String,
        firstFourDigits: String,
        limit: Double,
        closeDay: Int,
        expireDay: Int
    ) {
        self.id = UUID()
        self.name = name
        self.firstFourDigits = firstFourDigits
        self.limit = limit
        self.closeDay = closeDay
        self.expireDay = expireDay
    }
}
