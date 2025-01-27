//
//  CreateAccountViewController.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/01/25.
//

import Combine
import SharpnezDesignSystemUIKit

final class CreateAccountViewController: UISHViewController<CreateAccountViewProtocol, CreateAccountViewModelProtocol> {
    
    // MARK: Properties
    
    var onFinish: (() -> Void)?
    
    // MARK: View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultHeader(title: LoginLocalizable.CreateAccount.title)
        setupActions()
        setupBinding()
    }
}

private extension CreateAccountViewController {
    
    // MARK: Private methods
    
    func setupActions() {
        customView.buttonAction = { [weak self] model in
            self?.viewModel.submit(model)
        }
    }
    
    func setupBinding() {
        viewModel.viewStatus.bind { [weak self] state in
            switch state {
            case .success:
                self?.handleSuccess()
            case .loading:
                self?.customView.setupLoading(isLoading: true)
            case .none:
                break
            case .error(let errorMessage):
                self?.handleError(errorMessage)
            }
        }
    }
    
    func handleSuccess() {
        customView.setupLoading(isLoading: false)
        onFinish?()
    }
    
    func handleError(_ errorMessage: String) {
        showToast(type: .error, text: errorMessage, font: .poppins)
        customView.setupLoading(isLoading: false)
    }
}
