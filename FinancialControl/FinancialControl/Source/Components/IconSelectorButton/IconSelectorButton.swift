//
//  IconSelectorButton.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct IconSelectorButton: View {
    
    // MARK: Properties
    
    private let icon: SHIconType
    private let color: Color
    private let action: () -> Void
    
    // MARK: Init
    
    init(icon: SHIconType, color: Color, action: @escaping () -> Void) {
        self.icon = icon
        self.color = color
        self.action = action
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(Localizable.Commons.icon)
                .configureWithSH(color: color, font: .body(.montserrat, .medium))
            Button(action: action) {
                HStack(spacing: .extraSmall) {
                    SHIcon(icon: icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(color)
                        .frame(width: .big, height: .big)
                    Text(Localizable.Commons.selectIcon)
                        .configureWithSH(color: color, font: .body(.montserrat, .regular))
                    SHIcon(icon: .chevronRight)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(color)
                        .frame(width: .big, height: .big)
                }
            }
            .buttonStyle(.plain)
        }
    }
}
