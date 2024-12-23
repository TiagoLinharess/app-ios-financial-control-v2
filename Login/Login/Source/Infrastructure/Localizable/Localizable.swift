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
        static let name = LoginLocalizable.tr("Localizable", "createAccount.name", fallback: "Nome")
        static let email = LoginLocalizable.tr("Localizable", "createAccount.email", fallback: "E-mail")
        static let password = LoginLocalizable.tr("Localizable", "createAccount.password", fallback: "Senha")
        static let confirmPassword = LoginLocalizable.tr("Localizable", "createAccount.confirmPassword", fallback: "Confirmar senha")
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
