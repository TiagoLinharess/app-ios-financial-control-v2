//
//  RouterLocalizable.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum RouterLocalizable {
    
    // MARK: Modules
    
    enum Modules {
        static let home = RouterLocalizable.tr("Localizable", "module.home", fallback: "Home")
        static let login = RouterLocalizable.tr("Localizable", "module.login", fallback: "Login")
        static let singleForm = RouterLocalizable.tr("Localizable", "module.payment", fallback: "Add Payment")
        static let paymentType = RouterLocalizable.tr("Localizable", "module.paymentType", fallback: "Payment Types")
        static let creditCard = RouterLocalizable.tr("Localizable", "module.creditcard", fallback: "Credit Cards")
        static let product = RouterLocalizable.tr("Localizable", "module.product", fallback: "Products")
        static let budget = RouterLocalizable.tr("Localizable", "module.budget", fallback: "Budgets")
        static let bill = RouterLocalizable.tr("Localizable", "module.bill", fallback: "Bills")
    }
}

// MARK: Implementation Details

extension RouterLocalizable {
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
