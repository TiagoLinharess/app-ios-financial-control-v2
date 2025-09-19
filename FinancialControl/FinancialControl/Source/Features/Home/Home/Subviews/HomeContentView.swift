//
//  HomeContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 19/09/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeContentView: View {
    
    // MARK: Properties
    
    private let model: HomeDataModel
    
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(model: HomeDataModel) {
        self.model = model
    }
    
    // MARK: Body
    
    var body: some View {
        Text("Home")
    }
}
