//
//  StartView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/11/24.
//

import Home
import Core
import Router
import SharpnezDesignSystemSwiftUI
import SwiftUI

struct StartView: View {
    // MARK: - Properties -
    
    let homeFacade: any HomeFacadeProtocol
    
    @EnvironmentObject var router: Router
    @State private var isVisible = false
    
    // MARK: - Init -
    
    init(homeFacade: any HomeFacadeProtocol = HomeFacade()) {
        self.homeFacade = homeFacade
    }
    
    // MARK: - Body -
    
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
        .padding(.small)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(Constants.Images.background))
        .onAppear(perform: handleShow)
    }
    
    // MARK: - Private Methods -
    
    private func handleShow() {
        withAnimation(.easeInOut(duration: 1.0)) {
            isVisible.toggle()
        }
    }
    
    private func handleIsVisible() -> CGFloat {
        isVisible ? .one : .zero
    }
    
    private func handleOffset() -> CGFloat {
        isVisible ? .zero : .superBig
    }
    
    private func handleStart() {
        homeFacade.start(externalNavigateCompletion: didNavigate)
        router.navigate(to: Modules.home(homeFacade.getView()))
    }
}

extension StartView {
    // MARK: - External Destination -
    
    func didNavigate(to externalDestination: ExternalDestination) {
        let view: any View = switch externalDestination {
        case .home:
            homeFacade.getView()
        default:
            Text(externalDestination.title)
        }
        let module = Modules(externalDestination: externalDestination, view: view)
        router.navigate(to: module)
    }
}
