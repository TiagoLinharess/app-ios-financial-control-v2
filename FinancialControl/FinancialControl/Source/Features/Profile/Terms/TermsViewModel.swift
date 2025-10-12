//
//  TermsViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/10/25.
//

import Combine
import Foundation
import SwiftUI

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
        withAnimation { viewStatus = .loading }
        do {
            let termsModel = try await worker.readTerms()
            withAnimation { viewStatus = .success(termsModel.terms) }
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            withAnimation { viewStatus = .error(message) }
        }
    }
}
