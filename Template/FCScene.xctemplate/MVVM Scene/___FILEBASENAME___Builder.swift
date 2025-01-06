//
//  ___VARIABLE_productName:identifier___Builder.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import UIKit

struct ___VARIABLE_productName:identifier___Builder {
    func build() -> UIViewController {
        let view = ___VARIABLE_productName:identifier___View()
        let viewModel = ___VARIABLE_productName:identifier___ViewModel()
        let controller = ___VARIABLE_productName:identifier___ViewController(customView: view, viewModel: viewModel)
        return controller
    }
}
