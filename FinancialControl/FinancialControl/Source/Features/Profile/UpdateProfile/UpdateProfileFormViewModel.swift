//
//  UpdateProfileFormViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 03/10/25.
//

import Combine
import SharpnezDesignSystemSwiftUI
import SwiftUI

enum UpdateProfileFormViewState {
    case success
    case failure(String)
    case loading
}

protocol UpdateProfileFormViewModelProtocol: ObservableObject {
    var nickname: String { get set }
    var pronoun: Pronoun { get set }
    var birthdate: Date { get set }
    var viewState: UpdateProfileFormViewState { get set }
    var isUpdateLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    
    func read() async
    func submit() async -> Bool
}

final class UpdateProfileFormViewModel: UpdateProfileFormViewModelProtocol {
    
    // MARK: Porperties
    
    private let worker: UpdateProfileFormWorkerProtocol
    private var currentProfile: ProfileDataModel?
    
    @Published var nickname: String = ""
    @Published var pronoun: Pronoun = .he
    @Published var birthdate: Date = .now
    @Published var viewState: UpdateProfileFormViewState = .loading
    @Published var isUpdateLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(worker: UpdateProfileFormWorkerProtocol = UpdateProfileFormWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func read() async {
        viewState = .loading
        do {
            let model = try await worker.read()
            nickname = model.nickname
            pronoun = model.pronoun
            birthdate = model.birthdate
            currentProfile = model
            viewState = .success
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewState = .failure(message)
        }
    }
    
    func submit() async -> Bool {
        defer { isUpdateLoading = false }
        isUpdateLoading = true
        do {
            guard let currentProfile else { return false } // usar viewState }
            let model = ProfileDataModel(
                id: currentProfile.id,
                nickname: nickname,
                pronoun: pronoun,
                birthdate: birthdate,
                createdAt: currentProfile.createdAt,
                user: currentProfile.user
            )
            try await worker.update(model: model)
            return true
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            return false
        }
    }
}
