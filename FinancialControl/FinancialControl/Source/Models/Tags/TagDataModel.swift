//
//  TagDataModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 17/07/25.
//

import Foundation
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagDataModel: Identifiable, Equatable, Hashable {
    let id: String
    let backgroundColor: Color
    let textColor: Color
    let name: String
    let createdAt: Date
    
    init(id: String, backgroundColor: Color, textColor: Color, name: String, createdAt: Date) {
        self.id = id
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.name = name
        self.createdAt = createdAt
    }
    
    init?(from response: TagResponseModel) {
        guard let id = response.id else { return nil }
        self.id = id
        self.backgroundColor = Color(hex: response.backgroundColor)
        self.textColor = Color(hex: response.textColor)
        self.name = response.name
        self.createdAt = response.createdAt
    }
    
    func toRequestModel(userID: String) -> EditTagRequestModel {
        return EditTagRequestModel(
            id: id,
            userID: userID,
            name: name,
            backgroundColor: backgroundColor
                .toHexString(includeAlpha: true) ?? FlavorColors().brand,
            textColor: textColor.toHexString(includeAlpha: true) ?? FlavorColors().onBrand,
            createdAt: createdAt
        )
    }
}
