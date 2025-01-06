//
//  LaunchScreenViewController.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/01/25.
//

import SwiftUI

final class LaunchScreenViewController: UIHostingController<LaunchScreenView> {
    
    // MARK: Properties
    
    private let viewModel: LaunchScreenViewModelProtocol
    
    // MARK: Init
    
    init(rootView: LaunchScreenView, viewModel: LaunchScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
    }

    @available(*, unavailable)
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) { nil }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleFinishLaunching()
    }
    
    // MARK: Private methods
    
    private func handleFinishLaunching() {
        rootView.onFinish = { [weak self] in
            self?.viewModel.didFinish()
        }
    }
}
