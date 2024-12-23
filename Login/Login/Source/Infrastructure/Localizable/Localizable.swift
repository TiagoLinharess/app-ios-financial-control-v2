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
        static let numberCharactersRule = LoginLocalizable.tr("Localizable", "createAccount.numberCharactersRule", fallback: "• Pelo menos de 8 caracteres")
        static let capitalLetterRule = LoginLocalizable.tr("Localizable", "createAccount.capitalLetterRule", fallback: "• Pelo menos 1 letra maiúscula")
        static let lowercaseLetterRule = LoginLocalizable.tr("Localizable", "createAccount.lowercaseLetterRule", fallback: "• Pelo menos 1 letra minúscula")
        static let numberRule = LoginLocalizable.tr("Localizable", "createAccount.numberRule", fallback: "• Pelo menos 1 número")
        static let specialCharacterRule = LoginLocalizable.tr("Localizable", "createAccount.specialCharacterRule", fallback: "• Pelo menos 1 caractere especial")
        static let confirmPasswordRule = LoginLocalizable.tr("Localizable", "createAccount.confirmPasswordRule", fallback: "• As senhas precisam ser as mesmas")
        static let emailRule = LoginLocalizable.tr("Localizable", "createAccount.emailRule", fallback: "• O e-mail precisa ser válido")
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
