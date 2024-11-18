//
//  FinancialControlApp.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/11/24.
//

import Router
import SwiftUI

@main
struct FinancialControlApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            //TODO: Mudar o Facade protocol para View?
            StartView()
        }
    }
}
