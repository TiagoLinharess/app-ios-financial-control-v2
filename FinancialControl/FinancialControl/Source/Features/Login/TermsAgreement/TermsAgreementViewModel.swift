//
//  TermsAgreementViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 07/10/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI
import SwiftUI

enum TermsAgreementViewStatus {
    case loading
    case success(URL)
    case error(String)
}

protocol TermsAgreementViewModelProtocol: ObservableObject {
    var viewStatus: TermsAgreementViewStatus { get }
    var profileModel: AddProfileDataModel { get }
    var isSignOutLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    func handleLogout() async
    func readTerms() async
}

final class TermsAgreementViewModel: TermsAgreementViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: TermsAgreementWorkerProtocol
    let profileModel: AddProfileDataModel
    
    @Published var viewStatus: TermsAgreementViewStatus = .loading
    @Published var isSignOutLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(profileModel: AddProfileDataModel, worker: TermsAgreementWorkerProtocol = TermsAgreementWorker()) {
        self.profileModel = profileModel
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func readTerms() async {
        withAnimation { viewStatus = .loading }
        do {
            let termsModel = try await worker.readTerms()
            withAnimation { viewStatus = .success(termsModel.terms) }
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            withAnimation { viewStatus = .error(message) }
        }
    }
    
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

