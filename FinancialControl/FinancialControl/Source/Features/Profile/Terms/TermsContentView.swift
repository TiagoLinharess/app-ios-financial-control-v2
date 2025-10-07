//
//  TermsContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 07/10/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI
import WebKit

struct TermsContentView: View {
    
    // MARK: Properties
    
    private let url: URL
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // MARK: Init
    
    init(url: URL) {
        self.url = url
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            WebView(url: url)
                .cornerRadius(.small)
            Text(Localizable.Terms.alreadyAgreed)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .caption(.montserrat, .medium)
                )
        }
        .padding(.small)
    }
}
