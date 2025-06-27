//
//  SubPaymentTypesFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 16/06/25.
//

import SwiftUI

struct SubPaymentTypesFormView: View {
    
    private let id: UUID?
    @State private var paymentType: PaymentType
    @State private var name: String
    
    init(subPaymentType: SubPaymentType? = nil) {
        self.id = subPaymentType?.id
        self.paymentType = subPaymentType?.paymentType ?? .income
        self.name = subPaymentType?.name ?? String()
    }
    
    var body: some View {
        Form {
            VStack(alignment: .center, spacing: .small) {
                Picker("Tipo de pagamento", selection: $paymentType) {
                    ForEach(PaymentType.allCases, id: \.self) {
                        Text($0.title)
                    }
                }
                TextField("Nome", text: $name)
                    .autocorrectionDisabled(true)
            }
        }
        .navigationTitle("Criar Sub-tipo de pagamento")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    submit()
                } label: {
                    Image(systemName: Constants.Icons.add)
                }
            }
        }
    }
    
    private func submit() {
        
    }
}
