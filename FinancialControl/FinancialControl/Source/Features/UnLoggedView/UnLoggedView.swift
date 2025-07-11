//
//  UnLoggedView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 10/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct UnLoggedView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Body
    
    var body: some View {
        SHContainerView {
            Text(Localizable.UnLogged.loginToContinue)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .title3(.montserrat, .bold)
                )
        }
    }
}

