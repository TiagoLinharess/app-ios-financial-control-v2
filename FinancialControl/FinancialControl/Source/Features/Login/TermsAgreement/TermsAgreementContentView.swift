//
//  TermsAgreementContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 07/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI
import WebKit

enum TermsAgreementAction {
    case agree
    case dontAgree
}

struct TermsAgreementContentView: View {
    
    // MARK: Properties
    
    private let url: URL
    private let action: (TermsAgreementAction) -> Void
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Init
    
    init(url: URL, action: @escaping (TermsAgreementAction) -> Void) {
        self.url = url
        self.action = action
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            WebView(url: url)
                .cornerRadius(.small)
            Text(Localizable.Terms.agreementTitle)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .body(.montserrat, .medium)
                )
            SHButton(
                title: Localizable.Terms.agreementButtonAgree,
                style: .primary(.brand(colorScheme: colorScheme), .onBrand(colorScheme: colorScheme)),
                font: .montserrat,
                action: agree
            )
            SHButton(
                title: Localizable.Terms.agreementButtonDontAgree,
                style: .secondary(.onBackground(colorScheme: colorScheme)),
                font: .montserrat,
                action: dontAgree
            )
        }
        .padding(.small)
    }
    
    // MARK: Private methods
    
    private func agree() {
        action(.agree)
    }
    
    private func dontAgree() {
        action(.dontAgree)
    }
}
