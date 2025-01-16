//
//  ProviderLocalizable.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import SwiftUI

enum ProviderLocalizable {
    
    // MARK: Error
    
    enum Error {
        static let unknown = ProviderLocalizable.tr(
            "Localizable",
            "error.unknown",
            fallback: "Estamos fora do ar no momento, por favor tente novamente mais tarde."
        )
        static let generic = ProviderLocalizable.tr(
            "Localizable",
            "error.generic",
            fallback: "Ocorreu um erro, por favor tente novamente mais tarde."
        )
    }
}

// MARK: Implementation Details

extension ProviderLocalizable {
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
