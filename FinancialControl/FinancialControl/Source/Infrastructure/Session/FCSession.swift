//
//  FCSession.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

@propertyWrapper
struct FCSession<T> {
    
    // MARK: Properties
    
    var wrappedValue: T
    
    // MARK: Init
    
    init() {
        self.wrappedValue = FCSessionFactory.resolve(T.self)
    }
}
