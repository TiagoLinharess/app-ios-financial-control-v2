//
//  LaunchScreenManager.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/11/24.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
    // MARK: - Properties -
    
    @MainActor @Published private(set) var state: LaunchScreenStep = .firstStep
    
    // MARK: - Dismiss -
    
    @MainActor func dismiss() async {
        Task {
            try? await Task.sleep(for: Duration.seconds(1))
            state = .secondStep
        }
    }
}
