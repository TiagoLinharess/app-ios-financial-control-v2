//
//  HomeSingleton.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Core
import SwiftUI

final class HomeSingleton: NSObject {
    // MARK: - Singleton -
    
    static var shared: HomeSingleton?
    
    // MARK: - Properties -
    
    private var externalNavigateCompletion: ExternalDestinationCompletion?
    
    // MARK: - Start -
    
    static func start(externalNavigateCompletion: @escaping ExternalDestinationCompletion) {
        shared = HomeSingleton()
        shared?.externalNavigateCompletion = externalNavigateCompletion
    }
    
    // MARK: - Finish -
    
    static func finish() {
        shared?.externalNavigateCompletion = nil
        shared = nil
    }
    
    // MARK: - Public Methods -
    
    func navigate(to destination: ExternalDestination) {
        externalNavigateCompletion?(destination)
    }
}
