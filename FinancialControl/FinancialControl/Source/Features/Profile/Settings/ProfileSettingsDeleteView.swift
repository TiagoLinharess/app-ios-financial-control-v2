//
//  ProfileSettingsDeleteView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 12/10/25.
//

import SwiftUI
import SharpnezDesignSystemSwiftUI

struct ProfileSettingsDeleteView: View {
    
    // MARK: Properties
    
    private let action: () -> Void
    private let isDeleteLoading: Bool
    @Binding private var isPresented: Bool
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: Init
    
    init(
        action: @escaping () -> Void,
        isPresented: Binding<Bool>,
        isDeleteLoading: Bool
    ) {
        self.action = action
        self._isPresented = isPresented
        self.isDeleteLoading = isDeleteLoading
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .center, spacing: .small) {
            Text(Localizable.ProfileSettings.deleteTitle)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .body(.montserrat, .regular)
                )
            SHButton(
                title: Localizable.ProfileSettings.keepAccount,
                style: .primary(
                    .brand(colorScheme: colorScheme),
                    .onBrand(colorScheme: colorScheme)
                ),
                font: .montserrat,
                action: dismiss
            )
            SHButton(
                title: Localizable.ProfileSettings.deleteAccount,
                style: .secondary(.error(colorScheme: colorScheme)),
                font: .montserrat,
                isLoading: isDeleteLoading,
                action: action
            )
        }
    }
    
    // MARK: Private methods
    
    private func dismiss() {
        isPresented = false
    }
}
