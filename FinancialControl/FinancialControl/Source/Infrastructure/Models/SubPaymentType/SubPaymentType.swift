//
//  SubPaymentType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class SubPaymentType {
    
    @Attribute(.unique) var id: UUID
    var paymentType: PaymentType
    var name: String
    
    init(paymentType: PaymentType, name: String) {
        self.id = UUID()
        self.paymentType = paymentType
        self.name = name
    }
}
