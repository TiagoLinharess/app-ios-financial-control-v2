//
//  TransactionTypeSelectorView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TransactionTypeSelectorView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding private var selectedTransactionType: TransactionType
    
    // MARK: Init
    
    init(selectedTransactionType: Binding<TransactionType>) {
        self._selectedTransactionType = selectedTransactionType
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(Localizable.Commons.transactionType)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .body(.montserrat, .medium)
                )
            ScrollView(.horizontal) {
                HStack(spacing: .small) {
                    ForEach(TransactionType.allCases, id: \.self) { transactionType in
                        let color: Color = transactionType == selectedTransactionType
                        ? .onBackground(colorScheme: colorScheme)
                        : .onBackgroundWeak(colorScheme: colorScheme)
                        TransactionTypeItemView(type: transactionType, color: color) {
                            handleTap(at: transactionType)
                        }
                    }
                }
                .padding(.two)
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleTap(at transactionType: TransactionType) {
        selectedTransactionType = transactionType
    }
}
