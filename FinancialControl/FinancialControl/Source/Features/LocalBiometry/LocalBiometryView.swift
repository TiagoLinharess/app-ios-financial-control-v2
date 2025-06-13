//
//  LocalBiometryView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SwiftUI
import SwiftData

struct LocalBiometryView: View {
    
    // MARK: Properties
    
    @EnvironmentObject var localBiometry: LocalBiometry
    @Environment(\.modelContext) var modelContext: ModelContext
    
    // MARK: Body
    
    var body: some View {
        VStack {
            HStack {
                Text(Localizable.Biometry.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Spacer()
            Button(action: didValidate) {
                Text(Localizable.Biometry.validate)
                    .foregroundStyle(Color(.label))
                    .frame(maxWidth: .infinity)
            }
            .padding(.small)
            .glassEffect()
        }
        .padding(.small)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
    
    private func didValidate() {
        Task {
            let newTimestamp = LocalBiometryTimestamp(date: Date())
            modelContext.insert(newTimestamp)
            try? modelContext.save()
            await localBiometry.validate()
        }
    }
}
