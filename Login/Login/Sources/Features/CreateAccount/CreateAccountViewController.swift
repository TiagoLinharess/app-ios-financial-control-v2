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
    
    private var cancellables = Set<AnyCancellable>()
    
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
                self?.customView.setupLoading(isLoading: false)
            case .loading:
                self?.customView.setupLoading(isLoading: true)
            case .none:
                break
            case .error(let errorMessage):
                self?.showToast(type: .error, text: errorMessage, font: .poppins)
                self?.customView.setupLoading(isLoading: false)
            }
        }
    }
}
