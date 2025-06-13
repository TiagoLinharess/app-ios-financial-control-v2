//
//  LocalBiometryContainerView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SwiftData
import SwiftUI

struct LocalBiometryContainerView<Content: View>: View {
    
    // MARK: Body
    
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.modelContext) var modelContext: ModelContext
    @StateObject var localBiometry: LocalBiometry = LocalBiometry()
    var content: Content
    
    // MARK: Init
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: Body
    
    var body: some View {
        content
            .onChange(of: scenePhase) { oldValue, newValue in
                validateScenePhase(oldValue: oldValue, newValue: newValue)
            }
            .fullScreenCover(isPresented: $localBiometry.isPresent) {
                LocalBiometryView()
                    .environmentObject(localBiometry)
            }
    }
    
    func validateScenePhase(oldValue: ScenePhase, newValue: ScenePhase) {
        guard newValue == .active && (oldValue == .background || oldValue == .inactive) else {
            return
        }
        
        var fetchDescriptor = FetchDescriptor<LocalBiometryTimestamp>(
            sortBy: [SortDescriptor(\LocalBiometryTimestamp.date, order: .reverse)]
        )
        fetchDescriptor.fetchLimit = 1
        
        guard let result = try? modelContext.fetch(fetchDescriptor).first else {
            localBiometry.isPresent = true
            return
        }
        
        if result.needValidation() {
            localBiometry.isPresent = true
        }
    }
}
