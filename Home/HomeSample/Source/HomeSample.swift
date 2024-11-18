//
//  HomeSample.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Home
import Core
import CoreSample
import Router
import SwiftUI

struct HomeSample<Facade: HomeFacadeProtocol>: View {
    private let homeFacade: Facade
    @EnvironmentObject var router: Router
    
    init(homeFacade: Facade) {
        self.homeFacade = homeFacade
        homeFacade.start(externalDestinationDelegate: self)
    }
    
    var body: some View {
        Button("Navigate to home", action: navigateToHome)
    }
    
    private func navigateToHome() {
        router.navigate(to: Destination<Facade>.home(homeFacade))
    }
}

extension HomeSample: ExternalDestinationDelegate {
    func didNavigate(to externalDestination: ExternalDestination) {
        print(externalDestination)
    }
}
