//
//  Localizable.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SwiftUI

enum Localizable {
    
    // MARK: Biometry

    enum Biometry {
        static let title = Localizable.tr("Localizable", "biometry.title", fallback: "Use your device's local authentication to access the app.")
        static let validate = Localizable.tr("Localizable", "biometry.validate", fallback: "Validate")
    }
    
    // MARK: Modules
    
    enum Modules {
        static let home = Localizable.tr("Localizable", "module.home", fallback: "Home")
        static let budgets = Localizable.tr("Localizable", "module.budgets", fallback: "Budgets")
        static let bills = Localizable.tr("Localizable", "module.bills", fallback: "Bills")
        static let settings = Localizable.tr("Localizable", "module.settings", fallback: "Settings")
    }
    
    // MARK: Add Routes
    
    enum AddRoute {
        static let payment = Localizable.tr("Localizable", "add.route.payment", fallback: "Payment")
        static let monthlyPayment = Localizable.tr("Localizable", "add.route.monthly.payment", fallback: "Monthly payment")
        static let annualPayment = Localizable.tr("Localizable", "add.route.annual.payment", fallback: "Annual payment")
        static let purchaseInstallment = Localizable.tr("Localizable", "add.route.purchase.installment", fallback: "Purchase installment")
        static let product = Localizable.tr("Localizable", "add.route.product", fallback: "Product")
        static let subPaymentType = Localizable.tr("Localizable", "add.route.sub.payment.type", fallback: "Sub payment type")
        static let creditcard = Localizable.tr("Localizable", "add.route.creditcard", fallback: "Creditcard")
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
