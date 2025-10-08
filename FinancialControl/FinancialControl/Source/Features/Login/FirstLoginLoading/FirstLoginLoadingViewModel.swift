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
    private let profileModel: AddProfileDataModel
    
    @Published var title: String = Localizable.Profile.finishing
    @Published var viewState: FirstLoginViewState = .loading
    
    // MARK: Init
    
    init(
        profileModel: AddProfileDataModel,
        worker: FirstLoginLoadingWorkerProtocol = FirstLoginLoadingWorker()
    ) {
        self.worker = worker
        self.profileModel = profileModel
    }
    
    // MARK: Public methods
    
    func execute() async -> Bool {
        do {
            viewState = .loading
            try await worker.execute(model: profileModel)
            return true
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
            return false
        }
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
}
