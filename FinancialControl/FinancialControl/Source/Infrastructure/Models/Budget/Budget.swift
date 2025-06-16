//
//  Budget.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class Budget {
    
    @Attribute(.unique) var id: UUID
    var title: String
    var startDate: Date
    var endDate: Date
    var outcomeLimit: Double
    var creditLimit: Double
    
    init(
        title: String,
        startDate: Date,
        endDate: Date,
        outcomeLimit: Double,
        creditLimit: Double
    ) {
        self.id = UUID()
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.outcomeLimit = outcomeLimit
        self.creditLimit = creditLimit
    }
}
