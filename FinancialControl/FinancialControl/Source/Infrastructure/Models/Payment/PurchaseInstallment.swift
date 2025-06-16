//
//  PurchaseInstallment.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class PurchaseInstallment {
    
    @Attribute(.unique) var id: UUID
    var subPaymentId: UUID
    var installmentId: UUID
    var creditCardId: UUID?
    var name: String
    var value: Double
    var payed: Bool
    
    init(
        subPaymentId: UUID,
        installmentId: UUID,
        creditCardId: UUID? = nil,
        name: String,
        value: Double,
        payed: Bool
    ) {
        self.id = UUID()
        self.subPaymentId = subPaymentId
        self.installmentId = installmentId
        self.creditCardId = creditCardId
        self.name = name
        self.value = value
        self.payed = payed
    }
}
