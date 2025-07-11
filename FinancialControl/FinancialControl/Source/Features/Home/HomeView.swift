//
//  ContentView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var authentication: Authentication
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var toast: SHToastViewModel?
    @State private var isLoading: Bool = false
    
    var body: some View {
        SHContainerView {
            VStack {
                SHButton(
                    title: "Sair",
                    style: .primary(
                        .brand(colorScheme: colorScheme),
                        .onBrand(colorScheme: colorScheme)
                    ),
                    font: .montserrat,
                    isLoading: isLoading,
                    action: handleClickLogout
                )
            }
            .padding(.small)
        }
    }
    
    func handleClickLogout() {
        Task {
            defer { isLoading = false }
            isLoading = true
            do {
                try await authentication.logout()
            } catch {
                toast = SHToastViewModel(
                    style: .error,
                    font: .montserrat,
                    message: error.localizedDescription
                )
            }
        }
    }
}
