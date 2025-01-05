//
//  ShortcutsView.swift
//  Home
//
//  Created by Tiago Linhares on 14/11/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ShortcutsView<Store: ShortcutsAppStoreProtocol>: View {
    // MARK: - Properties -

    @StateObject var store: Store
    weak var singleton: HomeSingleton?
    
    // MARK: - Init -
    
    init(store: Store, singleton: HomeSingleton? = HomeSingleton.shared) {
        self._store = StateObject(wrappedValue: store)
        self.singleton = singleton
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
                        singleton?.navigate(to: destination)
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
