//
//  StartView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/11/24.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct StartView: View {
    @State private var isVisible = false
    
    var body: some View {
        VStack(alignment: .center, spacing: .small) {
            Spacer()
            Text(Localizable.Start.title)
                .configureWithSH(color: .onPrimarySH, font: .title1(.poppins, .regular))
            Spacer()
            Button(action: handleStart) {
                Text(Localizable.Start.button)
                    .frame(maxWidth: .infinity)
            }
            .primarySHStyle(
                font: .body(.montserrat, .regular),
                color: .onPrimarySH,
                onColor: .primarySH
            )
        }
        .offset(y: handleOffset())
        .opacity(handleIsVisible())
        .animation(.easeInOut(duration: 1.0), value: isVisible)
        .padding(.small)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(Constants.Images.background))
        .onAppear(perform: handleShow)
    }
    
    private func handleShow() {
        isVisible.toggle()
    }
    
    private func handleIsVisible() -> CGFloat {
        isVisible ? .one : .zero
    }
    
    private func handleOffset() -> CGFloat {
        isVisible ? .zero : .superBig
    }
    
    private func handleStart() {
        print("Start")
    }
}
