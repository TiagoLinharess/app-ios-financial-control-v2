//
//  PronounItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct PronounItemView: View {
    
    // MARK: Properties
    
    private let pronoun: Pronoun
    private let color: Color
    private let action: () -> Void
    
    // MARK: Init
    
    init(pronoun: Pronoun, color: Color, action: @escaping () -> Void) {
        self.pronoun = pronoun
        self.color = color
        self.action = action
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: .zero) {
                Text(pronoun.name)
                    .configureWithSH(
                        color: color,
                        font: .caption(.montserrat, .regular)
                    )
            }
            .padding(.extraSmall)
            .overlay {
                Capsule()
                    .strokeBorder(color, lineWidth: 1.5)
            }
        }
        .buttonStyle(.plain)
    }
}
