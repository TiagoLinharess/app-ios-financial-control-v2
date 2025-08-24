//
//  SideMenu.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import Combine

final class SideMenuState: ObservableObject {
    @Published var isExpanded: Bool = false
}
