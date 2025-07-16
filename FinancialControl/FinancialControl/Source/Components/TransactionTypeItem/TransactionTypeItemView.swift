//
//  TransactionTypeItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TransactionTypeItemView: View {
    
    // MARK: Properties
    
    private let type: TransactionType
    private let color: Color
    private let action: () -> Void
    
    // MARK: Init
    
    init(type: TransactionType, color: Color, action: @escaping () -> Void) {
        self.type = type
        self.color = color
        self.action = action
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: .zero) {
                SHIcon(icon: type.icon)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(color)
                    .frame(width: .big, height: .big)
                Spacer()
                Text(type.title)
                    .configureWithSH(
                        color: color,
                        font: .caption(.montserrat, .regular)
                    )
            }
            .padding(.vertical, .extraSmall)
            .frame(width: .superGiant, height: .superGiant)
            .overlay {
                RoundedRectangle(cornerRadius: .small)
                    .stroke(color, lineWidth: 1.5)
            }
        }
        .buttonStyle(.plain)
    }
}
