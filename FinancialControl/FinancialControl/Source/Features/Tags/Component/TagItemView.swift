//
//  TagItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagItemView: View {
    
    // MARK: Properties
    
    private let name: String
    private let backgroundColor: Color
    private let textColor: Color
    
    // MARK: Init
    
    init(name: String, backgroundColor: Color, textColor: Color) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    // MARK: Body
    
    var body: some View {
        Text(Localizable.Tags.item(name))
            .configureWithSH(color: textColor, font: .body(.montserrat, .regular))
            .padding(.small)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .small))
    }
}
