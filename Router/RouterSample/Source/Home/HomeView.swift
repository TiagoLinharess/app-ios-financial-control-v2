//
//  HomeView.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import Router
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var path: Router
    
    var body: some View {
        VStack {
            ForEach([Destination.Home, Destination.Products], id: \.self) { destination in
                Button(destination.title) {
                    path.navigate(to: destination)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
    }
}
