//
//  AddTagViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Foundation
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct AddTagViewModel {
    let color: Color
    let name: String
    let createdAt: Date
    
    init(color: Color, name: String) {
        self.color = color
        self.name = name
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddTagRequestModel {
        return AddTagRequestModel(
            userID: userID,
            name: name,
            color: color.toHexString(includeAlpha: true) ?? "#3B70A2",
            createdAt: createdAt
        )
    }
}
