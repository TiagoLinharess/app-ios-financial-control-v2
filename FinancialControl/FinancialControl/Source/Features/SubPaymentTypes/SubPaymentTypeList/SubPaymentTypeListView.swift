//
//  SubPaymentTypeListView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 27/06/25.
//

import SwiftUI
import SwiftData

struct SubPaymentTypeListView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var router: Router
    @Environment(\.modelContext) private var modelContext
    @Query private var subPaymentTypes: [SubPaymentType]
    
    // MARK: Body
    
    var body: some View {
        List {
            ForEach(PaymentType.allCases, id: \.self) { paymentType in
                let filtered = subPaymentTypes.filter { $0.paymentType == paymentType }
                if !filtered.isEmpty {
                    Section(header: Text(paymentType.title)) {
                        ForEach(filtered) { subPaymentType in
                            Button(action: {
                                update(at: subPaymentType)
                            }) {
                                HStack {
                                    Text(subPaymentType.name)
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                        .onDelete { offsets in
                            for index in offsets {
                                let item = filtered[index]
                                modelContext.delete(item)
                            }
                        }
                        .deleteDisabled(false)
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle(Localizable.Modules.subPaymentTypes)
        .toolbar {
            Button(action: add) {
                Image(systemName: Constants.Icons.add)
                    .padding(.nano)
            }
        }
    }
    
    // MARK: Private methods
    
    private func add() {
        router.push(.subPaymentTypeForm())
    }
    
    private func update(at subPaymentType: SubPaymentType) {
        router.push(.subPaymentTypeForm(subPaymentType))
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let item = subPaymentTypes[index]
            modelContext.delete(item)
        }
    }
}
