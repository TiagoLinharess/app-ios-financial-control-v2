//
//  SideMenuFeature.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

enum SideMenuFeature: String, CaseIterable, Hashable, Identifiable {
    case categories
    
    var icon: SHIconType {
        switch self {
        case .categories: .category
        }
    }
    
    var title: String {
        switch self {
        case .categories: Localizable.Modules.categories
        }
    }
    
    var id: Int {
        switch self {
        case .categories: 0
        }
    }
    
    var toDestination: Destination {
        switch self {
        case .categories: .categories
        }
    }
}
