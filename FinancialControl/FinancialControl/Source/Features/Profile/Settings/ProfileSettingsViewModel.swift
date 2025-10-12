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
    var isDeleteLoading: Bool { get set }
    var isDeleteModalPresented: Bool { get set }
    var toast: SHToastViewModel? { get set }
    func handleLogout() async
    func handleDelete() async -> Bool
}

final class ProfileSettingsViewModel: ProfileSettingsViewModelProtocol {
    
    // MARK: Porpeties
    
    private let worker: ProfileSettingsWorkerProtocol
    @Published var isSignOutLoading: Bool = false
    @Published var isDeleteLoading: Bool = false
    @Published var isDeleteModalPresented: Bool = false
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
    
    func handleDelete() async -> Bool {
        defer {
            isDeleteLoading = false
            isDeleteModalPresented = false
        }
        isDeleteLoading = true
        do {
            try await worker.delete()
            return true
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            return false
        }
    }
}
