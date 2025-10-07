//
//  TermsViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/10/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI

enum TermsViewStatus {
    case loading
    case success(URL)
    case error(String)
}

protocol TermsViewModelProtocol: ObservableObject {
    var viewStatus: TermsViewStatus { get }
    func readTerms() async
}

final class TermsViewModel: TermsViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: TermsWorkerProtocol
    
    @Published var viewStatus: TermsViewStatus = .loading
    
    // MARK: Init
    
    init(worker: TermsWorkerProtocol = TermsWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func readTerms() async {
        viewStatus = .loading
        do {
            let termsModel = try await worker.readTerms()
            viewStatus = .success(termsModel.terms)
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            viewStatus = .error(message)
        }
    }
}
