//
//  ProfileFormView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 03/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ProfileFormView: View {
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding private var pronoun: Pronoun
    @Binding private var nickname: String
    @Binding private var birthdate: Date
    
    private let isLoading: Bool
    private let subtitle: String?
    private let buttonTitle: String
    private let onSubmit: () -> Void
    
    // MARK: Init
    
    init(
        subtitle: String? = nil,
        buttonTitle: String,
        pronoun: Binding<Pronoun>,
        nickname: Binding<String>,
        birthdate: Binding<Date>,
        isLoading: Bool,
        onSubmit: @escaping () -> Void
    ) {
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
        self._pronoun = pronoun
        self._nickname = nickname
        self._birthdate = birthdate
        self.isLoading = isLoading
        self.onSubmit = onSubmit
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .medium) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: .medium) {
                    if let subtitle {
                        Text(subtitle)
                            .configureWithSH(
                                color: .onBackground(colorScheme: colorScheme),
                                font: .body(.montserrat, .semiBold)
                            )
                    }
                    PronounSelectorView(selectedPronoun: $pronoun)
                    SHTextField(
                        title: Localizable.Profile.nickname,
                        color: .onBackground(colorScheme: colorScheme),
                        font: .montserrat,
                        text: $nickname
                    )
                    SHDatePicker(
                        title: Localizable.Profile.birthdate,
                        color: .onBackground(colorScheme: colorScheme),
                        font: .montserrat,
                        date: $birthdate,
                        range: ...Date()
                    )
                }
            }
            .padding(.small)
            SHButton(
                title: buttonTitle,
                style: .primary(
                    .brand(colorScheme: colorScheme),
                    .onBrand(colorScheme: colorScheme)
                ),
                font: .montserrat,
                isLoading: isLoading,
                action: onSubmit
            )
            .padding(.small)
        }
        .onTapGesture(perform: closeKeyboard)
    }
}
