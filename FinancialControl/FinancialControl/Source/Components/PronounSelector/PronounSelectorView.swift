//
//  PronounSelectorView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct PronounSelectorView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding private var selectedPronoun: Pronoun
    
    // MARK: Init
    
    init(selectedPronoun: Binding<Pronoun>) {
        self._selectedPronoun = selectedPronoun
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(Localizable.Commons.selectPronoun)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .body(.montserrat, .medium)
                )
            ScrollView(.horizontal) {
                HStack(spacing: .small) {
                    ForEach(Pronoun.allCases, id: \.self) { pronoun in
                        let color: Color = pronoun == selectedPronoun
                        ? .onBackground(colorScheme: colorScheme)
                        : .onBackgroundWeak(colorScheme: colorScheme)
                        PronounItemView(pronoun: pronoun, color: color) {
                            handleTap(at: pronoun)
                        }
                    }
                }
                .padding(.two)
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleTap(at pronoun: Pronoun) {
        selectedPronoun = pronoun
    }
}

