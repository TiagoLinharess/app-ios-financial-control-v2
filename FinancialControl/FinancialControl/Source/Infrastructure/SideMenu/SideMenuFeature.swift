//
//  SideMenuFeature.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 11/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

// MARK: Localizable
enum SideMenuFeature: String, CaseIterable, Hashable, Identifiable {
    case categories
    case tags
    
    var icon: SHIconType {
        switch self {
        case .categories: .category
        case .tags: .chart
        }
    }
    
    var title: String {
        switch self {
        case .categories: Localizable.Modules.categories
        case .tags: "Tags" // TODO: Localizable
        }
    }
    
    var id: Int {
        switch self {
        case .categories: 0
        case .tags: 1
        }
    }
    
    var toDestination: Destination {
        switch self {
        case .categories: .categories
        case .tags: .tags
        }
    }
}
