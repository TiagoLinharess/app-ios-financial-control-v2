//
//  HomeSample.swift
//  Home
//
//  Created by Tiago Linhares on 16/11/24.
//

import Home
import Router
import SwiftUI

struct HomeSample<Facade: HomeFacadeProtocol>: View {
    private let homeFacade: Facade
    @EnvironmentObject var router: Router
    
    init(homeFacade: Facade) {
        self.homeFacade = homeFacade
    }
    
    var body: some View {
        Button("Navigate to home", action: navigateToHome)
            .task {
                homeFacade.start { externalDestination in
                    print(externalDestination)
                }
            }
    }
    
    private func navigateToHome() {
        router.navigate(to: Destination<Facade>.home(homeFacade))
    }
}
