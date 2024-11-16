//
//  HomeView.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct HomeView: View {
    
    // MARK: - Init -
    
    public init () { }
    
    // MARK: - Body -
    
    public var body: some View {
        SHContainerView(title: "home.title".localizedLowercase, font: .poppins) {
            Text(HomeLocalizable.Home.title)
            ShortcutsView()
        }
    }
}
