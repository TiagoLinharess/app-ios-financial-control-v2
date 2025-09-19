//
//  FirstLoginFormViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/09/25.
//

import Combine
import Foundation
import SharpnezDesignSystemSwiftUI

protocol FirstLoginFormViewModelProtocol: ObservableObject {
    var nickname: String { get set }
    var pronoun: Pronoun { get set }
    var birthdate: Date { get set }
    var isLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    
    func submit() async -> FirstLoginStep?
}

final class FirstLoginFormViewModel: FirstLoginFormViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: FirstLoginFormWorkerProtocol
    
    @Published var nickname: String = ""
    @Published var pronoun: Pronoun = .he
    @Published var birthdate: Date = .now
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(worker: FirstLoginFormWorkerProtocol = FirstLoginFormWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func submit() async -> FirstLoginStep? {
        isLoading = true
        defer { isLoading = false }
        do {
            let model = AddProfileDataModel(
                nickname: nickname,
                pronoun: pronoun,
                birthdate: birthdate
            )
            return try await worker.execute(model: model)
        } catch {
            let message = ((error as? FCError) ?? FCError.generic).message
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
            return nil
        }
    }
}
