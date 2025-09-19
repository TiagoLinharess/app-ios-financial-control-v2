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
    
    @FCSession private var session: any FCSessionModelProtocol
    @Published var isLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    // MARK: Public methods
    
    // TODO: Verificar se o usuário concluiu os steps de login (saber diferenciar erro de nil no profile) (verificar tbm a quantidade do path ao terminar o fluxo de login)
    
    func logout() async {
        defer { isLoading = false }
        isLoading = true
        do {
            try await session.logout()
        } catch {
            var message: String = error.localizedDescription
            if let fcError = error as? FCError {
                message = fcError.message
            }
            
            toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
        }
    }
}
