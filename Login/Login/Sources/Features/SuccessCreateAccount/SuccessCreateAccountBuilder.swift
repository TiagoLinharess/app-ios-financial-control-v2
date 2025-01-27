//
//  SuccessCreateAccountBuilder.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezDesignSystemUIKit
import UIKit

struct SuccessCreateAccountBuilder {
    func build(finishAction: @escaping () -> Void) -> UIViewController {
        let viewModel = SuccessCreateAccountViewModel(primaryAction: finishAction)
        let controller = UISHFeedbackViewController<SuccessCreateAccountViewModel>(
            viewModel: viewModel
        )
        return controller
    }
}
