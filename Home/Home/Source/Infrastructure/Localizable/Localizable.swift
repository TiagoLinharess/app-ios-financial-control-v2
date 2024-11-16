//
//  Localizable.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum HomeLocalizable {
    // MARK: - Home -
    
    enum Home {
        static let title = HomeLocalizable.tr("Localizable", "home.title", fallback: "Financial Control")
    }
}

// MARK: - Implementation Details -

extension HomeLocalizable {
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
