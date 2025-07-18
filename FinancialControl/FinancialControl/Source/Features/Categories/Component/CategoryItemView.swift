//
//  CategoryItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct CategoryItemView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) var colorScheme
    private let icon: SHIconType
    private let name: String
    
    // MARK: Init
    
    init(icon: SHIconType, name: String) {
        self.icon = icon
        self.name = name
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            SHIcon(icon: icon)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(Color.onSurface(colorScheme: colorScheme))
                .frame(width: .big, height: .big)
            Text(name)
                .configureWithSH(
                    color: .onSurface(colorScheme: colorScheme),
                    font: .body(.poppins, .regular)
                )
        }
        .padding(.small)
        .background(Color.surface(colorScheme: colorScheme))
        .clipShape(RoundedRectangle(cornerRadius: .small))
    }
}
