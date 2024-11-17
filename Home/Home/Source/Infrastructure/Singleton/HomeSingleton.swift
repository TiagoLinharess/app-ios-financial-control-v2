//
//  HomeSingleton.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

final class HomeSingleton: NSObject {
    // MARK: - Singleton -
    
    static var shared: HomeSingleton?
    
    // MARK: - Properties -
    
    private var navigate: ExternalDestinationCompletion?
    
    // MARK: - Start -
    
    static func start(navigate: @escaping ExternalDestinationCompletion) {
        shared = HomeSingleton()
        shared?.navigate = navigate
    }
    
    // MARK: - Finish -
    
    static func finish() {
        shared?.navigate = nil
        shared = nil
    }
    
    // MARK: - Public Methods -
    
    func navigate(to destination: ExternalDestination) {
        navigate?(destination)
    }
}
