//
//  HomeViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine
import SwiftUI
import SharpnezDesignSystemSwiftUI

enum HomeViewState {
    case success(HomeDataModel)
    case loading
    case failure(String)
}

protocol HomeViewModelProtocol: ObservableObject {
    var isLogoutLoading: Bool { get }
    var viewState: HomeViewState { get set }
    var toast: SHToastViewModel? { get set }
    func loadUserPhoto() -> URL?
    func loadHome() async
    func logout() async
}


final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: HomeWorkerProtocol
    
    @Published var isLogoutLoading: Bool = false
    @Published var viewState: HomeViewState = .loading
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(worker: HomeWorkerProtocol = HomeWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func loadUserPhoto() -> URL? {
        return worker.loadUserPhoto()
    }
    
    func loadHome() async {
        viewState = .loading
        do {
            let model = try await worker.loadHome()
            viewState = .success(model)
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
        }
    }
    
    func logout() async {
        defer { isLogoutLoading = false }
        isLogoutLoading = true
        do {
            try await worker.logout()
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
        }
    }
}
