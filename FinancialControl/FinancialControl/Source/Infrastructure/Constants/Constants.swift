//
//  Constants.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import SwiftUI

enum Constants {
    
    // MARK: Sizes
    
    enum Sizes {
        static let containerWidth: CGFloat = 900
        static let sideBarWidth: CGFloat = 300
        static let sideBarTopPadding: CGFloat = 100
    }
    
    // MARK: Images
    
    enum Images {
        static let logo: String = "logo"
    }
    
    // MARK: Error
    
    enum Error {
        static let userCanceledLogin: String = "The user canceled the sign-in flow."
        static let credentialsDoNotMatch: String = "The supplied credentials do not correspond to the previously signed in user."
    }
    
    // MARK: Locale
    
    enum Locale {
        static let brazil: String = "pt_BR"
    }
}
