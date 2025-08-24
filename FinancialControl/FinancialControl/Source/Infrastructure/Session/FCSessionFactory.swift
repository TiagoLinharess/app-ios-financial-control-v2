//
//  FCSessionFactory.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 22/08/25.
//

enum FCSessionFactory {
    
    // MARK: Properties
    
    static var dependencies: [String: Any] = [:]
    
    // MARK: Methods
    
    static func register<T>(_ dependency: T) {
        let name = String(describing: T.self)
        dependencies[name] = dependency
    }
    
    static func resolve<T>(_: T.Type) -> T {
        let name = String(describing: T.self)
        guard let dependency = dependencies[name] as? T else {
            fatalError("Dependency \(name) not registered")
        }
        
        return dependency
    }
}
