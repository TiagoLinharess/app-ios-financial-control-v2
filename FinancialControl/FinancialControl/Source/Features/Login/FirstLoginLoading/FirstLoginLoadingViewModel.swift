//
//  FirstLoginLoadingViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

import Combine

enum FirstLoginViewState: Equatable {
    case loading
    case failure(String)
}

protocol FirstLoginLoadingViewModelProtocol: ObservableObject {
    var title: String { get }
    var viewState: FirstLoginViewState { get }
    func execute() async -> Bool
    func logout() async -> Bool
}

final class FirstLoginLoadingViewModel: FirstLoginLoadingViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: FirstLoginLoadingWorkerProtocol
    private let step: FirstLoginStep
    
    @Published var title: String
    @Published var viewState: FirstLoginViewState = .loading
    
    // MARK: Init
    
    init(
        step: FirstLoginStep,
        worker: FirstLoginLoadingWorkerProtocol = FirstLoginLoadingWorker()
    ) {
        self.worker = worker
        self.step = step
        self.title = step.loadingMessage
    }
    
    // MARK: Public methods
    
    func execute() async -> Bool {
        if step == .created {
            return await createBasicData()
        }
        
        await waitToFinish()
        return true
    }
    
    func logout() async -> Bool {
        do {
            title = Localizable.Commons.closing
            viewState = .loading
            try await worker.logout()
            return true
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
            return false
        }
    }
    
    // MARK: Private methods
    
    private func createBasicData() async -> Bool {
        do {
            viewState = .loading
            try await worker.execute()
            return true
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
            return false
        }
    }
    
    private func waitToFinish() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
    }
}
