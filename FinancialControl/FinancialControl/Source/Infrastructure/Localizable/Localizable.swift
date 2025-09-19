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
        static let sessionExpired = Localizable.tr("Localizable", "error.session.expired", fallback: "Your session has expired. Please log in again.")
        static let parseError = Localizable.tr("Localizable", "error.parse.error", fallback: "An error occurred while processing the data. Please try again later.")
    }
    
    // MARK: Commons
    
    enum Commons {
        static let signOut = Localizable.tr("Localizable", "commons.sign.out", fallback: "sign out")
        static let goBack = Localizable.tr("Localizable", "commons.go.back", fallback: "go back")
        static let delete = Localizable.tr("Localizable", "commons.delete", fallback: "delete")
        static let new = Localizable.tr("Localizable", "commons.new", fallback: "new")
        static let update = Localizable.tr("Localizable", "commons.update", fallback: "update")
        static let create = Localizable.tr("Localizable", "commons.create", fallback: "create")
        static let continueText = Localizable.tr("Localizable", "commons.continue", fallback: "continue")
        static let tryAgain = Localizable.tr("Localizable", "commons.try.again", fallback: "try again")
        static let menu = Localizable.tr("Localizable", "commons.menu", fallback: "Menu")
        static let name = Localizable.tr("Localizable", "commons.name", fallback: "Name")
        static let transactionType = Localizable.tr("Localizable", "commons.transaction.type", fallback: "Transaction type")
        static let emptyName = Localizable.tr("Localizable", "commons.name.empty", fallback: "Fill the field \"name\".")
        static let emptyNickname = Localizable.tr("Localizable", "commons.name.empty", fallback: "Fill the field \"What can we call you?\"")
        static let title = Localizable.tr("Localizable", "commons.title", fallback: "Financial Control")
        static let icon = Localizable.tr("Localizable", "commons.icon", fallback: "Icon")
        static let selectIcon = Localizable.tr("Localizable", "commons.select.icon", fallback: "Select icon")
        static let selectTextColor = Localizable.tr("Localizable", "commons.select.text.color", fallback: "Select text color")
        static let selectBackgroundColor = Localizable.tr("Localizable", "commons.select.background.color", fallback: "Select background color")
        static let selectPronoun = Localizable.tr("Localizable", "commons.select.pronoun", fallback: "What are your pronouns?")
        static let he = Localizable.tr("Localizable", "commons.he", fallback: "He/Him")
        static let she = Localizable.tr("Localizable", "commons.she", fallback: "She/Her")
        static let they = Localizable.tr("Localizable", "commons.they", fallback: "They/Them")
        static func createdAt(_ dateString: String) -> String {
            Localizable.tr("Localizable", "commons.created.at", dateString, fallback: "Created at: %@")
        }
    }
    
    // MARK: Modules
    
    enum Modules {
        static let home = Localizable.tr("Localizable", "module.home", fallback: "Home")
        static let budgets = Localizable.tr("Localizable", "module.budgets", fallback: "Budgets")
        static let bills = Localizable.tr("Localizable", "module.bills", fallback: "Bills")
        static let settings = Localizable.tr("Localizable", "module.settings", fallback: "Settings")
        static let categories = Localizable.tr("Localizable", "module.categories", fallback: "Categories")
        static let tags = Localizable.tr("Localizable", "module.tags", fallback: "Tags")
    }
    
    // MARK: Login
    
    enum Login {
        static let description = Localizable.tr("Localizable", "login.description", fallback: "Welcome to Financial Control!\nManage your expenses simply\nand securely.")
        static let button = Localizable.tr("Localizable", "login.button", fallback: "sign in with your Google account")
    }
    
    // MARK: Profile
    
    enum Profile {
        static let title = Localizable.tr("Localizable", "profile.title", fallback: "Welcome to Financial Control!")
        static let nickname = Localizable.tr("Localizable", "profile.nickname", fallback: "What can we call you?")
        static let birthdate = Localizable.tr("Localizable", "profile.birthdate", fallback: "What is your date of birth?")
    }
    
    // MARK: Transaction type
    
    enum TransactionType {
        static let income = Localizable.tr("Localizable", "transaction.type.income", fallback: "Income")
        static let debit = Localizable.tr("Localizable", "transaction.type.debit", fallback: "Debit")
        static let credit = Localizable.tr("Localizable", "transaction.type.credit", fallback: "Credit")
        static let incomes = Localizable.tr("Localizable", "transaction.type.incomes", fallback: "Incomes")
        static let debits = Localizable.tr("Localizable", "transaction.type.debits", fallback: "Debits")
        static let credits = Localizable.tr("Localizable", "transaction.type.credits", fallback: "Credits")
    }
    
    // MARK: Categories
    
    enum Categories {
        static let emptyStateTitle = Localizable.tr("Localizable", "categories.empty.state.title", fallback: "You don't have any categories yet!")
        static let emptyStateDescription = Localizable.tr("Localizable", "categories.empty.state.description", fallback: "Click the “+” to add a category")
        static let errorStateTitle = Localizable.tr("Localizable", "categories.error.state.title", fallback: "Oops, an error occurred while loading your categories")
        static let new = Localizable.tr("Localizable", "categories.new", fallback: "New Category")
        static let edit = Localizable.tr("Localizable", "categories.edit", fallback: "Update Category")
        static let deleteTitle = Localizable.tr("Localizable", "categories.delete.title", fallback: "Do you want to delete the category?")
        static let deleteDescription = Localizable.tr("Localizable", "categories.delete.description", fallback: "If you have a transaction linked to the category, it cannot be deleted")
    }
    
    // MARK: Tags
    
    enum Tags {
        static let new = Localizable.tr("Localizable", "tags.new", fallback: "New Tag")
        static let edit = Localizable.tr("Localizable", "tags.edit", fallback: "Update Tag")
        static func item(_ text: String) -> String {
            Localizable.tr("Localizable", "tags.item", text, fallback: "#%@")
        }
        static let emptyStateTitle = Localizable.tr("Localizable", "tags.empty.state.title", fallback: "You don't have any tags yet!")
        static let emptyStateDescription = Localizable.tr("Localizable", "tags.empty.state.description", fallback: "Click the “+” to add a tag")
        static let errorStateTitle = Localizable.tr("Localizable", "tags.error.state.title", fallback: "Oops, an error occurred while loading your tags")
        static let deleteTitle = Localizable.tr("Localizable", "tags.delete.title", fallback: "Do you want to delete the tag?")
        static let deleteDescription = Localizable.tr("Localizable", "tags.delete.description", fallback: "If you have a transaction linked to the tag, it cannot be deleted")
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

