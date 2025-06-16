//
//  MonthlyPayment.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class MonthlyPayment {
    
    @Attribute(.unique) var id: UUID
    var subPaymentId: UUID
    var creditCardId: UUID?
    var name: String
    var day: String
    var value: Double
    var payed: Bool
    
    init(
        subPaymentId: UUID,
        creditCardId: UUID? = nil,
        name: String,
        day: String,
        value: Double,
        payed: Bool
    ) {
        self.id = UUID()
        self.subPaymentId = subPaymentId
        self.creditCardId = creditCardId
        self.name = name
        self.day = day
        self.value = value
        self.payed = payed
    }
}
