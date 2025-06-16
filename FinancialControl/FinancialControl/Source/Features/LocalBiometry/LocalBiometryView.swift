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
        VStack(spacing: .small) {
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
                    .foregroundStyle(Color.primary)
                    .padding(.small)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(GlassButtonStyle())
        }
        .padding(.small)
#if !os(macOS)
        .background(Color(.systemBackground).ignoresSafeArea())
#endif
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
