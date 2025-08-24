//
//  TagListViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 24/08/25.
//

import Combine
import SharpnezDesignSystemSwiftUI
import SwiftUI

enum TagListViewState {
    case loading
    case success
    case empty
    case failure(FCError)
}

protocol TagListViewModelProtocol: ObservableObject {
    var tags: [TagDataModel] { get }
    var viewState: TagListViewState { get }
    func read() async
}

final class TagListViewModel: TagListViewModelProtocol {
    
    // MARK: Properties
    
    private let worker: TagListWorkerProtocol
    @Published private(set) var tags: [TagDataModel] = []
    @Published private(set) var viewState: TagListViewState = .loading
    
    // MARK: Init
    
    init(worker: TagListWorkerProtocol = TagListWorker()) {
        self.worker = worker
    }
    
    // MARK: Public methods
    
    func read() async {
        viewState = .loading
        do {
            let tags = try await worker.read()
            self.tags = tags
            viewState = tags.isEmpty ? .empty : .success
        } catch {
            viewState = .failure((error as? FCError) ?? FCError.generic)
        }
    }
}
