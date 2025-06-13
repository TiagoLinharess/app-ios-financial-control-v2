//
//  LocalBiometry.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 13/06/25.
//

import Combine
import LocalAuthentication

final class LocalBiometry: ObservableObject {
    @Published var isPresent: Bool = false
    
    func validate() async {
        if await authenticateUser() {
            isPresent = false
        }
    }
    
    func authenticateUser() async -> Bool {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let success = await evaluatePolicyAsync(
                context: context,
                policy: .deviceOwnerAuthenticationWithBiometrics,
                reason: Localizable.Biometry.title
            )
            
            if success {
                return true
            } else {
                return await passwordPhoneAsync()
            }
        } else {
            return await passwordPhoneAsync()
        }
    }
    
    private func passwordPhoneAsync() async -> Bool {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let success = await evaluatePolicyAsync(
                context: context,
                policy: .deviceOwnerAuthentication,
                reason: Localizable.Biometry.title
            )
            
            if success {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    private func evaluatePolicyAsync(context: LAContext, policy: LAPolicy, reason: String) async -> Bool {
        return await withCheckedContinuation { continuation in
            context.evaluatePolicy(policy, localizedReason: reason) { success, _ in
                continuation.resume(returning: success)
            }
        }
    }
}
