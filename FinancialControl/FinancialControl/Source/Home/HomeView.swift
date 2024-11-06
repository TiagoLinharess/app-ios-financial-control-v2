//
//  HomeView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var path: Navigation.Features.Router.Path
    
    var body: some View {
        VStack {
            Text("Home")
                .foregroundStyle(.white)
            Button("A") {
                path.navigate(to: .featureA)
            }
            Button("B") {
                path.navigate(to: .featureB)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
    }
}
