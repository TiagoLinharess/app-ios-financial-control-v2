//
//  Localizable.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum CoreLocalizable {
    // MARK: - Modules -
    
    enum Modules {
        static let home = CoreLocalizable.tr("Localizable", "module.home", fallback: "Home")
        static let singleForm = CoreLocalizable.tr("Localizable", "module.single.form", fallback: "Add Payment")
        static let paymentType = CoreLocalizable.tr("Localizable", "module.payment.type", fallback: "Payment Types")
        static let creditCard = CoreLocalizable.tr("Localizable", "module.creditcard", fallback: "Credit Cards")
        static let products = CoreLocalizable.tr("Localizable", "module.products", fallback: "Products")
        static let budgets = CoreLocalizable.tr("Localizable", "module.budgets", fallback: "Budgets")
        static let bills = CoreLocalizable.tr("Localizable", "module.bills", fallback: "Bills")
    }
}

// MARK: - Implementation Details -

extension CoreLocalizable {
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
