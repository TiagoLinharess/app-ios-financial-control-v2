//
//  ShortcutsView.swift
//  Home
//
//  Created by Tiago Linhares on 14/11/24.
//

import Router
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ShortcutsView<Store: ShortcutsAppStoreProtocol>: View {
    // MARK: - Properties -

    @EnvironmentObject private var router: Router
    @StateObject var store: Store
    
    // MARK: - Init -
    
    init(store: Store) {
        self._store = StateObject(wrappedValue: store)
    }
    
    // MARK: - Body -
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .extraSmall) {
                Spacer().frame(width: .small)
                ForEach(store.state.items, id: \.self) { destination in
                    SHShortcutButton(
                        image: destination.iconName,
                        label: destination.title,
                        font: .montserrat
                    ) {
                        router.navigate(to: destination)
                    }
                }
                Spacer().frame(width: .small)
            }
        }
        .task {
            store.dispatch(action: .fetch)
        }
    }
}
