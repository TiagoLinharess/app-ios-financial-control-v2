//
//  CreateCategoryService.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import FirebaseAuth
import SharpnezDesignSystemSwiftUI

protocol CreateCategoryServiceProtocol {
    func executeBasics() async throws
    func execute(model: AddCategoryDataModel) async throws
}

final class CreateCategoryService: FCService, CreateCategoryServiceProtocol {
    
    // MARK: Properties
    
    private let repository: CategoryRepositoryProtocol
    private let auth: Auth
    
    // MARK: Init
    
    init(
        repository: CategoryRepositoryProtocol = CategoryRepository(),
        auth: Auth = .auth(),
    ) {
        self.repository = repository
        self.auth = auth
    }
    
    // MARK: Public methods
    
    func executeBasics() async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            
            let basicCategories: [AddCategoryDataModel] = [
                AddCategoryDataModel(transactionType: .income, icon: .wallet, name: Localizable.Categories.Basics.revenues),
                AddCategoryDataModel(transactionType: .debit, icon: .receiptMinus, name: Localizable.Categories.Basics.fixedExpenses),
                AddCategoryDataModel(transactionType: .debit, icon: .receiptMinus, name: Localizable.Categories.Basics.variableExpenses),
                AddCategoryDataModel(transactionType: .credit, icon: .card, name: Localizable.Categories.Basics.installments),
                AddCategoryDataModel(transactionType: .credit, icon: .card, name: Localizable.Categories.Basics.signatures),
            ]
            
            for category in basicCategories {
                try await repository.create(requestModel: category.toRequestModel(userID: userID))
            }
        } catch {
            throw await super.handleError(error: error)
        }
    }
    
    func execute(model: AddCategoryDataModel) async throws {
        do {
            guard let userID = auth.currentUser?.uid else { throw FCError.sessionExpired }
            try validateIsEmpty(text: model.name, errorMessage: Localizable.Commons.emptyName)
            try await repository.create(requestModel: model.toRequestModel(userID: userID))
        } catch {
            throw await super.handleError(error: error)
        }
    }
}
