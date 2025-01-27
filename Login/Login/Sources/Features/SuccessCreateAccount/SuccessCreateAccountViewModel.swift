//
//  SuccessCreateAccountViewModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezDesignSystemUIKit

final class SuccessCreateAccountViewModel: UISHFeedbackViewModelProtocol {
    
    // MARK: Properties
    
    var type: SharpnezDesignSystemUIKit.UISHFeedbackType = .success
    var title: String = LoginLocalizable.SuccessCreateAccount.title
    var description: String = LoginLocalizable.SuccessCreateAccount.description
    var primaryActionTitle: String = LoginLocalizable.SuccessCreateAccount.button
    var primaryAction: () -> Void

    var secondaryActionTitle: String?
    var secondaryAction: (() -> Void)?
    
    // MARK: Init
    
    init(primaryAction: @escaping () -> Void) {
        self.primaryAction = primaryAction
    }
}
