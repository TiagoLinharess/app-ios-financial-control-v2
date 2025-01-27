//
//  SampleItem.swift
//  Sample
//
//  Created by Tiago Linhares on 27/01/25.
//

public struct SampleItem {
    
    public let title: String
    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
