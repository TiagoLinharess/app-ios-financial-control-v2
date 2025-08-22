//
//  HomeViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

import Combine
import SwiftUI
import SharpnezDesignSystemSwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var toast: SHToastViewModel? { get set }
    func logout() async
}


final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Properties
    
    private let service: AuthenticationServiceProtocol
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    // MARK: Public methods
    
    func logout() async {
        defer { isLoading = false }
        isLoading = true
        do {
            try await service.logout()
        } catch {
            var message: String = error.localizedDescription
            if let fcError = error as? FCError {
                message = fcError.message
            }
            
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
        }
    }
}
