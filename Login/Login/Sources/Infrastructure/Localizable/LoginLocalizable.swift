//
//  LoginLocalizable.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum LoginLocalizable {
    
    // MARK: Commons
    
    enum Commons {
        static let name = LoginLocalizable.tr("Localizable", "commons.name", fallback: "name")
        static let familyName = LoginLocalizable.tr("Localizable", "commons.familyName", fallback: "family name")
        static let email = LoginLocalizable.tr("Localizable", "commons.email", fallback: "e-mail")
        static let password = LoginLocalizable.tr("Localizable", "commons.password", fallback: "password")
        static let confirmPassword = LoginLocalizable.tr(
            "Localizable",
            "commons.confirmPassword",
            fallback: "confirm password"
        )
    }
    
    // MARK: Create account
    
    enum CreateAccount {
        static let title = LoginLocalizable.tr(
            "Localizable",
            "createAccount.title",
            fallback: "Create Account"
        )
        static let numberCharactersRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.numberCharactersRule",
            fallback: "At least 8 characters"
        )
        static let capitalLetterRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.capitalLetterRule",
            fallback: "At least 1 capital letter"
        )
        static let lowercaseLetterRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.lowercaseLetterRule",
            fallback: "At least 1 lowercase letter"
        )
        static let numberRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.numberRule",
            fallback: "At least 1 number"
        )
        static let specialCharacterRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.specialCharacterRule",
            fallback: "At least 1 special character"
        )
        static let confirmPasswordRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.confirmPasswordRule",
            fallback: "Passwords must be equal"
        )
        static let emailRule = LoginLocalizable.tr(
            "Localizable",
            "createAccount.emailRule",
            fallback: "E-mail must be valid"
        )
        static let userExistsError = LoginLocalizable.tr(
            "Localizable",
            "createAccount.userExistsError",
            fallback: "The e-mail sent already exists."
        )
    }
    
    // MARK: Success Create Account
    
    enum SuccessCreateAccount {
        static let title = LoginLocalizable.tr(
            "Localizable",
            "SuccessCreateAccount.title",
            fallback: "Success!"
        )
        static let description = LoginLocalizable.tr(
            "Localizable",
            "SuccessCreateAccount.description",
            fallback: "Account created with success! Click on the button below to go back to start."
        )
        static let button = LoginLocalizable.tr(
            "Localizable",
            "SuccessCreateAccount.button",
            fallback: "Back to start"
        )
    }
}

// MARK: Implementation Details

extension LoginLocalizable {
    private static func tr(
        _ table: String,
        _ key: String,
        _ args: CVarArg...,
        fallback value: String = ""
    ) -> String {
        let locale = getPreferredLocale()
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: locale, arguments: args)
    }
    
    static func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
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
