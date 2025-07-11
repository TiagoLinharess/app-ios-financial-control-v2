//
//  Localizable.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SwiftUI

enum Localizable {
    
    // MARK: Error
    
    enum Error {
        static let userPermission = Localizable.tr("Localizable", "error.user.permission", fallback: "Google access permission not granted.")
        static let userCanceledLogin = Localizable.tr("Localizable", "error.user.canceled.login", fallback: "The user canceled the sign-in flow.")
        static let generic = Localizable.tr("Localizable", "error.generic", fallback: "An unexpected error has occurred.")
    }
    
    // MARK: Login
    
    enum Login {
        static let description = Localizable.tr("Localizable", "login.description", fallback: "Welcome to Financial Control!\nManage your expenses simply\nand securely.")
        static let button = Localizable.tr("Localizable", "login.button", fallback: "sign in with your Google account")
    }
    
    // MARK: UnLogged
    
    enum UnLogged {
        static let loginToContinue = Localizable.tr("Localizable", "unlogged.login.to.continue", fallback: "Efetue o login para continuar")
    }
    
    // MARK: Commons
    
    enum Commons {
        static let menu = Localizable.tr("Localizable", "commons.menu", fallback: "Menu")
        static let new = Localizable.tr("Localizable", "commons.new", fallback: "New")
        static let update = Localizable.tr("Localizable", "commons.update", fallback: "Update")
        static let oops = Localizable.tr("Localizable", "commons.oops", fallback: "Oops!")
        static let ok = Localizable.tr("Localizable", "commons.ok", fallback: "ok")
        static let name = Localizable.tr("Localizable", "commons.name", fallback: "Name")
        static let paymentType = Localizable.tr("Localizable", "commons.payment.type", fallback: "Payment type")
        static let emptyName = Localizable.tr("Localizable", "commons.name.empty", fallback: "Fill the field \"name\".")
        static let title = Localizable.tr("Localizable", "commons.title", fallback: "Financial Control")
    }
    
    // MARK: Modules
    
    enum Modules {
        static let home = Localizable.tr("Localizable", "module.home", fallback: "Home")
        static let budgets = Localizable.tr("Localizable", "module.budgets", fallback: "Budgets")
        static let bills = Localizable.tr("Localizable", "module.bills", fallback: "Bills")
        static let settings = Localizable.tr("Localizable", "module.settings", fallback: "Settings")
        static let subPaymentTypes = Localizable.tr("Localizable", "module.sub.payment.types", fallback: "Sub payment types")
    }
    
    // MARK: Payment type
    
    enum PaymentType {
        static let income = Localizable.tr("Localizable", "payment.type.income", fallback: "Income")
        static let outcome = Localizable.tr("Localizable", "payment.type.outcome", fallback: "Outcome")
        static let credit = Localizable.tr("Localizable", "payment.type.credit", fallback: "Credit")
    }
    
    // MARK: Sub Payment type
    
    enum SubPaymentType {
        static let formTitle = Localizable.tr("Localizable", "sub.payment.type.form.title", fallback: " Sub payment type")
    }
}

// MARK: Implementation Details

extension Localizable {
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

