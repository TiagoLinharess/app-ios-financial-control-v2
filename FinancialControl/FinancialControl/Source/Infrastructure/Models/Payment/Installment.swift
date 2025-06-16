//
//  MonthlyPayment.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class Installment {
    
    @Attribute(.unique) var id: UUID
    var initialDate: Date
    var finalDate: Date
    
    init(initialDate: Date, finalDate: Date) {
        self.id = UUID()
        self.initialDate = initialDate
        self.finalDate = finalDate
    }
}
