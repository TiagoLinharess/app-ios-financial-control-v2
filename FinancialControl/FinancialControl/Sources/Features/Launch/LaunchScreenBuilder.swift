//
//  LaunchScreenBuilder.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

struct LaunchScreenBuilder {
    func build(onFinish: (() -> Void)?) -> UIViewController {
        let view = LaunchScreenView()
        let viewModel = LaunchScreenViewModel()
        let controller = LaunchScreenViewController(rootView: view, viewModel: viewModel)
        
        viewModel.onFinish = onFinish
        
        return controller
    }
}
