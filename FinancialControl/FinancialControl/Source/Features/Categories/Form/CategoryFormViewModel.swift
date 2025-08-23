//
//  CategoryFormViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import Combine
import SharpnezDesignSystemSwiftUI
import SwiftUI

protocol CategoryFormViewModelProtocol: ObservableObject {
    var id: String? { get }
    var transactionType: TransactionType { get set }
    var icon: SHIconType { get set }
    var name: String { get set }
    var presentIconSelector: Bool { get set }
    var isFormLoading: Bool { get set }
    var isDeleteLoading: Bool { get set }
    var toast: SHToastViewModel? { get set }
    var title: String { get }
    var buttonTitle: String { get }
    func handlePresentIconSelector()
    func handleSubmit() async -> Bool
    func handleDelete() async -> Bool
}

final class CategoryFormViewModel: CategoryFormViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: CategoryFormWorkerProtocol
    private let createdAt: Date?
    let id: String?
    @Published var transactionType: TransactionType
    @Published var icon: SHIconType
    @Published var name: String
    @Published var presentIconSelector: Bool = false
    @Published var isFormLoading: Bool = false
    @Published var isDeleteLoading: Bool = false
    @Published var toast: SHToastViewModel?
    
    var title: String {
        id == nil ? Localizable.Categories.new : Localizable.Categories.edit
    }
    
    var buttonTitle: String {
        id == nil ? Localizable.Commons.create : Localizable.Commons.update
    }
    
    // MARK: Init
    
    init(model: CategoryDataModel?, worker: CategoryFormWorkerProtocol = CategoryFormWorker()) {
        self.worker = worker
        self.id = model?.id
        self.createdAt = model?.createdAt
        self.transactionType = model?.transactionType ?? .income
        self.icon = model?.icon ?? .coin
        self.name = model?.name ?? String()
    }
    
    // MARK: Public methods
    
    func handlePresentIconSelector() {
        presentIconSelector = true
    }
    
    func handleSubmit() async -> Bool {
        defer { isFormLoading = false }
        isFormLoading = true
        if let id, let createdAt {
            return await handleUpdate(id: id, createdAt: createdAt)
        } else {
            return await handleCreate()
        }
    }
    
    func handleDelete() async -> Bool {
        defer { isDeleteLoading = false }
        isDeleteLoading = true
        do {
            guard let id else { throw FCError.generic }
            try await worker.delete(id: id)
            return true
        } catch {
            handleError(error: error)
            return false
        }
    }
    
    // MARK: Private methods
    
    private func handleCreate() async -> Bool {
        do {
            let model = AddCategoryDataModel(
                transactionType: transactionType,
                icon: icon,
                name: name
            )
            try await worker.create(model: model)
            return true
        } catch {
            handleError(error: error)
            return false
        }
    }
    
    private func handleUpdate(id: String, createdAt: Date) async -> Bool {
        do {
            let model = CategoryDataModel(
                id: id,
                transactionType: transactionType,
                icon: icon,
                name: name,
                createdAt: createdAt
            )
            try await worker.update(model: model)
            return true
        } catch {
            handleError(error: error)
            return false
        }
    }
    
    private func handleError(error: Error) {
        let message = ((error as? FCError) ?? FCError.generic).message
        toast = SHToastViewModel(style: .error, font: .montserrat, message: message)
    }
}
