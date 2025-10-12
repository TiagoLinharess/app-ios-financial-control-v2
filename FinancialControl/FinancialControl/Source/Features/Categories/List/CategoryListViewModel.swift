//
//  CategoryListViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 23/08/25.
//

import Combine
import SharpnezDesignSystemSwiftUI
import SwiftUI

enum CategoryListViewState {
    case loading
    case success
    case empty
    case failure(FCError)
}

protocol CategoryListViewModelProtocol: ObservableObject {
    var categories: [CategoryDataModel] { get }
    var viewState: CategoryListViewState { get }
    func read() async
}

@MainActor
final class CategoryListViewModel: CategoryListViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: CategoryListWorkerProtocol
    @Published private(set) var categories: [CategoryDataModel] = []
    @Published private(set) var viewState: CategoryListViewState = .loading
    
    // MARK: Init
    
    init(worker: CategoryListWorkerProtocol = CategoryListWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func read() async {
        withAnimation { viewState = .loading }
        do {
            let categories = try await worker.read()
            self.categories = categories
            withAnimation { viewState = categories.isEmpty ? .empty : .success }
        } catch {
            withAnimation { viewState = .failure((error as? FCError) ?? FCError.generic) }
        }
    }
}
