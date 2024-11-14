//
//  HomeView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/11/24.
//

import Router
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text("Financial Control")
                    .configureWithSH(color: .onPrimarySH, font: .title2(.poppins, .regular))
                    .padding(.horizontal, .small)
                    .padding(.bottom, .extraSmall)
                Spacer()
            }
            .background(Color.primarySH)
            ScrollView {
                Spacer().frame(height: .small)
                HStack {
                    Text("Your Budgets")
                        .configureWithSH(color: .onSurfaceSH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.surfaceSH)
                .clipShape(.capsule)
                HStack {
                    Text("Your Bills")
                        .configureWithSH(color: .onSurfaceSH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.surfaceSH)
                .clipShape(.capsule)
                HStack {
                    Text("Your Credits Cards")
                        .configureWithSH(color: .onSecondarySH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.secondarySH)
                .clipShape(.capsule)
                HStack {
                    Text("success")
                        .configureWithSH(color: .onSuccessSH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.successSH)
                .clipShape(.capsule)
                HStack {
                    Text("warning")
                        .configureWithSH(color: .onWarningSH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.warningSH)
                .clipShape(.capsule)
                HStack {
                    Text("error")
                        .configureWithSH(color: .onErrorSH, font: .body(.montserrat, .regular))
                }
                .padding()
                .background(Color.errorSH)
                .clipShape(.capsule)
                Button {
                    print("payment added")
                } label: {
                    Text("Add Payment")
                }
                .primarySHStyle(font: .body(.montserrat, .regular))
                Button {
                    print("payment deleted")
                } label: {
                    Text("Delete Payment")
                }
                .secondarySHStyle(font: .body(.montserrat, .regular))
                Button {
                    print("payment deleted")
                } label: {
                    Text("Delete Payment")
                }
                .ghostSHStyle(font: .body(.montserrat, .regular))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundSH)
            .clipShape(.rect(topLeadingRadius: .medium, topTrailingRadius: .medium))
            .background(Color.primarySH)
            .ignoresSafeArea()
        }
    }
}
