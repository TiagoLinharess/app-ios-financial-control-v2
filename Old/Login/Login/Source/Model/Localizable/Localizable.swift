//
//  Localizable.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum LoginLocalizable {
    
    // MARK: SignIn
    
    enum SignIn {
        static let title = LoginLocalizable.tr("Localizable", "signIn.title", fallback: "Entrar")
    }
    
    // MARK: SignUp
    
    enum SignUp {
        static let title = LoginLocalizable.tr("Localizable", "signUp.title", fallback: "Criar conta")
        static let name = LoginLocalizable.tr("Localizable", "signUp.name", fallback: "Nome")
        static let email = LoginLocalizable.tr("Localizable", "signUp.email", fallback: "E-mail")
        static let password = LoginLocalizable.tr("Localizable", "signUp.password", fallback: "Senha")
        static let confirmPassword = LoginLocalizable.tr("Localizable", "signUp.confirmPassword", fallback: "Confirmar senha")
        static let numberCharactersRule = LoginLocalizable.tr("Localizable", "signUp.numberCharactersRule", fallback: "• Pelo menos de 8 caracteres")
        static let capitalLetterRule = LoginLocalizable.tr("Localizable", "signUp.capitalLetterRule", fallback: "• Pelo menos 1 letra maiúscula")
        static let lowercaseLetterRule = LoginLocalizable.tr("Localizable", "signUp.lowercaseLetterRule", fallback: "• Pelo menos 1 letra minúscula")
        static let numberRule = LoginLocalizable.tr("Localizable", "signUp.numberRule", fallback: "• Pelo menos 1 número")
        static let specialCharacterRule = LoginLocalizable.tr("Localizable", "signUp.specialCharacterRule", fallback: "• Pelo menos 1 caractere especial")
        static let confirmPasswordRule = LoginLocalizable.tr("Localizable", "signUp.confirmPasswordRule", fallback: "• As senhas precisam ser as mesmas")
        static let emailRule = LoginLocalizable.tr("Localizable", "signUp.emailRule", fallback: "• O e-mail precisa ser válido")
    }
}

// MARK: Implementation Details

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
