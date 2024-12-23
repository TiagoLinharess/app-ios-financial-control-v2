//
//  Localizable.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum LoginLocalizable {
    // MARK: - Login -
    
    enum Login {
        static let title = LoginLocalizable.tr("Localizable", "login.title", fallback: "Entrar")
    }
    
    // MARK: - Create Account -
    
    enum CreateAccount {
        static let title = LoginLocalizable.tr("Localizable", "createAccount.title", fallback: "Criar conta")
    }
}

// MARK: - Implementation Details -

extension LoginLocalizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String = "") -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
