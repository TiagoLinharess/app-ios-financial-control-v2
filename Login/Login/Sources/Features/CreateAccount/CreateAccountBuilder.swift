//
//  CreateAccountBuilder.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

struct CreateAccountBuilder {
    func build(onFinish: @escaping () -> Void) -> UIViewController {
        let view = CreateAccountView()
        let viewModel = CreateAccountViewModel()
        let controller = CreateAccountViewController(customView: view, viewModel: viewModel)
        controller.onFinish = onFinish
        return controller
    }
}
