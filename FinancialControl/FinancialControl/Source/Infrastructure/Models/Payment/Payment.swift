//
//  Payment.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class Payment {
    
    @Attribute(.unique) var id: UUID
    var subPaymentId: UUID
    var creditCardId: UUID?
    var productId: UUID?
    var name: String
    var date: Date
    var value: Double
    var payed: Bool
    
    init(
        subPaymentId: UUID,
        creditCardId: UUID? = nil,
        productId: UUID? = nil,
        name: String,
        date: Date,
        value: Double,
        payed: Bool
    ) {
        self.id = UUID()
        self.subPaymentId = subPaymentId
        self.creditCardId = creditCardId
        self.productId = productId
        self.name = name
        self.date = date
        self.value = value
        self.payed = payed
    }
}
