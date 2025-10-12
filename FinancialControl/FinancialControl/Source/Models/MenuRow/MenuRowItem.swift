//
//  MenuRowItem.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 26/09/25.
//

import SharpnezDesignSystemSwiftUI

protocol MenuRowItem {
    var icon: SHIconType { get }
    var title: String { get }
    var id: Int { get }
    var toDestination: Destination { get }
}
