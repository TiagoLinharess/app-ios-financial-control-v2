//
//  StartViewController.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/01/25.
//

import SharpnezDesignSystemUIKit

final class StartViewController: UISHViewController<StartViewProtocol, StartViewModelProtocol> {
    
    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension StartViewController {
    
    // MARK: Private methods
    
    func setupActions() {
        customView.didTapLogin = { [weak self] in
            self?.viewModel.didTapLogin()
        }
        
        customView.didTapCreateAccount = { [weak self] in
            self?.viewModel.didTapCreateAccount()
        }
    }
}
