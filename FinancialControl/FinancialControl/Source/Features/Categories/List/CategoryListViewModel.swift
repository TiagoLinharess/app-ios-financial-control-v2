//
//  CategoryListViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import Combine
import SharpnezDesignSystemSwiftUI

enum CategoryListViewState {
    case loading
    case success
    case empty
    case failure(FCError)
}

protocol CategoryListViewModelProtocol: ObservableObject {
    var categories: [CategoryDataModel] { get }
    var viewState: CategoryListViewState { get }
    var toast: SHToastViewModel? { get set }
    func read() async
}

@MainActor
final class CategoryListViewModel: CategoryListViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: CategoryListWorkerProtocol
    @Published private(set) var categories: [CategoryDataModel] = []
    @Published private(set) var viewState: CategoryListViewState = .loading
    @Published var toast: SHToastViewModel?
    
    // MARK: Init
    
    init(worker: CategoryListWorkerProtocol = CategoryListWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func read() async {
        viewState = .loading
        do {
            let categories = try await worker.read()
            self.categories = categories
            viewState = categories.isEmpty ? .empty : .success
        } catch {
            viewState = .failure((error as? FCError) ?? FCError.generic)
        }
    }
}
