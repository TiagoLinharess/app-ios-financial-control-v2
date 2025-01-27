//
//  LoginFinish.swift
//  Login
//
//  Created by Tiago Linhares on 23/12/24.
//

import Core
import SwiftUI

public final class LoginFinish: ObservableObject {
    
    // MARK: Properties
    
    private let completion: FinishCompletion
    
    // MARK: Init
    
    public init(completion: @escaping FinishCompletion) {
        self.completion = completion
    }
    
    // MARK: Public Methods
    
    func finish() {
        completion()
    }
}
