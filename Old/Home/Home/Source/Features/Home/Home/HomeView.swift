//
//  HomeView.swift
//  Router
//
//  Created by Tiago Linhares on 05/11/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeView<Store: HomeAppStoreProtocol>: View {
    // MARK: - Properties -
    
    @StateObject var store: Store
    
    // MARK: - Init -
    
    init(store: Store) {
        self._store = StateObject(wrappedValue: store)
    }
    
    // MARK: - Body -
    
    var body: some View {
        SHContainerView(title: HomeLocalizable.Home.title, font: .poppins) {
            VStack(spacing: .small) {
                ForEach(store.state.items, id: \.self) { item in
                    item.view
                }
            }
        }
        .navigationBarHidden(true)
        .task {
            store.dispatch(action: .fetch)
        }
    }
}
