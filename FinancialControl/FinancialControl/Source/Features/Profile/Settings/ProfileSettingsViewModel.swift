//
//  ProfileSettingsViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 01/10/25.
//

import SharpnezDesignSystemSwiftUI
import Combine

protocol ProfileSettingsViewModelProtocol: ObservableObject {
    var isSignOutLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    func handleLogout() async
}

final class ProfileSettingsViewModel: ProfileSettingsViewModelProtocol {
    
    // MARK: Porpeties
    
    private let worker: ProfileSettingsWorkerProtocol
    @Published var isSignOutLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(worker: ProfileSettingsWorkerProtocol = ProfileSettingsWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func handleLogout() async {
        defer { isSignOutLoading = false }
        isSignOutLoading = true
        do {
            try await worker.logout()
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
        }
    }
}
