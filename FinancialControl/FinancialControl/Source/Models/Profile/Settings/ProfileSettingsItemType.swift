//
//  ProfileSettingsItemType.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 26/09/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

enum ProfileSettingsItemType: String, CaseIterable, Hashable, Identifiable, MenuRowItem {
    case editProfile
    case terms
    
    var id: Int {
        switch self {
        case .editProfile: 1
        case .terms: 0
        }
    }
    
    var icon: SHIconType {
        switch self {
        case .editProfile: .edit
        case .terms: .receipt
        }
    }
    
    var title: String {
        switch self {
        case .editProfile: Localizable.ProfileSettings.editProfile
        case .terms: Localizable.Modules.terms
        }
    }
    
    var toDestination: Destination {
        switch self {
        case .editProfile: .editProfile
        case .terms: .terms
        }
    }
}
