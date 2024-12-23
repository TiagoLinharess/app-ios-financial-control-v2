//
//  HomeSample.swift
//  Login
//
//  Created by Tiago Linhares on 16/11/24.
//

import Login
import Core
import CoreSample
import Router
import SwiftUI

struct HomeSample: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Button("Navigate to Sign In", action: { start(at: .signIn) })
        Button("Navigate to Sign Up", action: { start(at: .signUp) })
    }
    
    private func start(at destination: LoginDestination) {
        let finishModel = LoginFinish(completion: onFinish)
        let view = LoginContainerView(destination: destination)
            .environmentObject(finishModel)
        
        router.navigate(to: Destination.login(AnyView(view)))
    }
    
    private func onFinish() {
        print("Finish")
    }
}
