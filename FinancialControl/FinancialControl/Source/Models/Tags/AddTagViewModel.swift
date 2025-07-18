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
    let backgroundColor: Color
    let textColor: Color
    let name: String
    let createdAt: Date
    
    init(
        backgroundColor: Color,
        textColor: Color,
        name: String,
    ) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.name = name
        self.createdAt = Date()
    }
    
    func toRequestModel(userID: String) -> AddTagRequestModel {
        return AddTagRequestModel(
            userID: userID,
            name: name,
            backgroundColor: backgroundColor
                .toHexString(includeAlpha: true) ?? FlavorColors().brand,
            textColor: textColor.toHexString(includeAlpha: true) ?? FlavorColors().onBrand,
            createdAt: createdAt
        )
    }
}
