//
//  SubPaymentTypesFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 16/06/25.
//

import SwiftUI
import SwiftData

struct SubPaymentTypesFormView: View {
    
    // MARK: Properties
    
    private let id: UUID?
    private let title: String
    @State private var paymentType: PaymentType
    @State private var name: String
    @State private var alertPresented: Bool = false
    @State private var alertMessage: String = ""
    @Environment(\.modelContext) private var modelContext: ModelContext
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(subPaymentType: SubPaymentType? = nil) {
        self.id = subPaymentType?.id
        self.paymentType = subPaymentType?.paymentType ?? .income
        self.name = subPaymentType?.name ?? String()
        self.title = (id != nil ? Localizable.Commons.update : Localizable.Commons.new)
        + Localizable.SubPaymentType.formTitle
    }
    
    // MARK: Body
    
    var body: some View {
        Form {
            Text(title)
            VStack(alignment: .center, spacing: .small) {
                Picker(
                    Localizable.Commons.paymentType
                    + Constants.Signals.asterisk
                    + Constants.Signals.doubleDot,
                    selection: $paymentType
                ) {
                    ForEach(PaymentType.allCases, id: \.self) {
                        Text($0.title)
                    }
                }
                Divider()
                HStack {
                    Text(
                        Localizable.Commons.name
                        + Constants.Signals.asterisk
                        + Constants.Signals.doubleDot
                    )
                    TextField(Localizable.Commons.name, text: $name)
                        .autocorrectionDisabled(true)
                }
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    submit()
                } label: {
                    Image(systemName: Constants.Icons.done)
                        .padding(.nano)
                }
            }
        }
        .frame(maxWidth: 900)
        .alert(Localizable.Commons.oops, isPresented: $alertPresented) {
            Button {
                alertPresented.toggle()
            } label: {
                Text(Localizable.Commons.ok)
            }
        } message: {
            Text(alertMessage)
        }

    }
    
    // MARK: Private methods
    
    private func submit() {
        if name.isEmpty {
            handleEmptyName()
            return
        }
        
        if let id {
            update(id: id)
        } else {
            add()
        }
        
        router.pop()
    }
    
    private func handleEmptyName() {
        alertMessage = Localizable.Commons.emptyName
        alertPresented = true
    }
    
    private func add() {
        let model = SubPaymentType(paymentType: paymentType, name: name)
        modelContext.insert(model)
        try? modelContext.save()
    }
    
    private func update(id: UUID) {
        let descriptor = FetchDescriptor<SubPaymentType>(predicate: #Predicate { $0.id == id })
        if let subPaymentType = try? modelContext.fetch(descriptor).first {
            subPaymentType.paymentType = paymentType
            subPaymentType.name = name
            try? modelContext.save()
        }
    }
}
