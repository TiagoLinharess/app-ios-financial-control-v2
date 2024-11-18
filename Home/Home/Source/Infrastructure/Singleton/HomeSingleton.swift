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
    
    private var externalDestinationDelegate: ExternalDestinationDelegate?
    
    // MARK: - Start -
    
    static func start(externalDestinationDelegate: ExternalDestinationDelegate) {
        shared = HomeSingleton()
        shared?.externalDestinationDelegate = externalDestinationDelegate
    }
    
    // MARK: - Finish -
    
    static func finish() {
        shared?.externalDestinationDelegate = nil
        shared = nil
    }
    
    // MARK: - Public Methods -
    
    func navigate(to destination: ExternalDestination) {
        externalDestinationDelegate?.didNavigate(to: destination)
    }
}
