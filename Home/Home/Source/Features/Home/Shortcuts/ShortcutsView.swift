//
//  ShortcutsView.swift
//  Home
//
//  Created by Tiago Linhares on 14/11/24.
//

import Router
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ShortcutsView: View {
    // MARK: - Properties -
    
    @EnvironmentObject private var router: Router
    
    // MARK: - Body -
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .extraSmall) {
                Spacer().frame(width: .small)
                ForEach(Destination.allCases, id: \.self) { destination in
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
    }
}
