//
//  ProfileContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 20/09/25.
//

import SharpnezCore
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct ProfileContentView: View {
    
    // MARK: Properties
    
    private let model: ProfileDataModel
    private let reloadAction: () -> Void
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: Init
    
    init(model: ProfileDataModel, reloadAction: @escaping () -> Void) {
        self.model = model
        self.reloadAction = reloadAction
    }
    
    // MARK: Body
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: .small) {
                    AsyncImage(url: model.user.photoURL) { image in
                        image
                            .resizable()
                            .frame(width: .superGiant, height: .superGiant)
                            .clipShape(.circle)
                    } placeholder: {
                        SHLoading(
                            style: .medium,
                            color: .onBackground(colorScheme: colorScheme)
                        )
                    }
                    HStack(spacing: .nano) {
                        Text(model.nickname)
                            .configureWithSH(
                                color: .onBackground(colorScheme: colorScheme),
                                font: .subtitle(.montserrat, .regular)
                            )
                        Text(Localizable.Commons.inParentheses(model.pronoun.name))
                            .configureWithSH(
                                color: .onBackgroundWeak(colorScheme: colorScheme),
                                font: .caption(.montserrat, .regular)
                            )
                    }
                    Text(model.birthdate.toString(to: .normal) ?? String())
                        .configureWithSH(
                            color: .onBackground(colorScheme: colorScheme),
                            font: .body(.montserrat, .regular)
                        )
                }
            }
            .refreshable(action: reload)
            Spacer()
            VStack(alignment: .leading, spacing: .small) {
                Text(Localizable.Profile.googleAccount)
                    .configureWithSH(
                        color: .onBackground(colorScheme: colorScheme),
                        font: .body(.montserrat, .regular)
                    )
                Text(Localizable.Profile.googleName(model.user.displayName))
                    .configureWithSH(
                        color: .onBackground(colorScheme: colorScheme),
                        font: .body(.montserrat, .regular)
                    )
                Text(Localizable.Profile.googleEmail(model.user.email))
                    .configureWithSH(
                        color: .onBackground(colorScheme: colorScheme),
                        font: .body(.montserrat, .regular)
                    )
                Text(Localizable.Profile.googleObservation)
                    .configureWithSH(
                        color: .onBackgroundWeak(colorScheme: colorScheme),
                        font: .caption(.montserrat, .regular)
                    )
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.small)
    }
    
    // MARK: Private methods
    
    private func navigateToSettings() {
        // TODO: Settings
    }
    
    private func reload() {
        reloadAction()
    }
}
