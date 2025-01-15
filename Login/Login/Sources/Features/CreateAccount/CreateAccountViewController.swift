//
//  CreateAccountViewController.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/01/25.
//

import SharpnezDesignSystemUIKit

final class CreateAccountViewController: UISHViewController<CreateAccountViewProtocol, CreateAccountViewModelProtocol> {
    
    // MARK: View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultHeader(title: LoginLocalizable.CreateAccount.title)
        setupActions()
    }
}

private extension CreateAccountViewController {
    
    // MARK: Private methods
    
    func setupActions() {
        customView.buttonAction = { [weak self] model in
            self?.viewModel.submit(model)
        }
    }
}
