//
//  ProfileViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 20/09/25.
//

import Combine

enum ProfileViewState {
    case loading
    case success(ProfileDataModel)
    case failure(String)
}

protocol ProfileViewModelProtocol: ObservableObject {
    var viewState: ProfileViewState { get }
    func loadProfile() async
}

final class ProfileViewModel: ProfileViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: ProfileWorkerProtocol
    
    @Published var viewState: ProfileViewState = .loading
    
    // MARK: Init
    
    init(worker: ProfileWorkerProtocol = ProfileWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func loadProfile() async {
        viewState = .loading
        do {
            let model = try await worker.loadProfile()
            viewState = .success(model)
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
        }
    }
}
