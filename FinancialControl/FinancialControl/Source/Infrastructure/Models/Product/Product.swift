//
//  Product.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Foundation
import SwiftData

@Model
final class Product {
    
    @Attribute(.unique) var id: UUID
    var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
