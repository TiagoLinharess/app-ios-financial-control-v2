//
//  TagListItemView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

public struct TagListItemView: View {
    
    // MARK: Properties
    
    private let tag: TagViewModel
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(tag: TagViewModel) {
        self.tag = tag
    }
    
    // MARK: Body
    
    public var body: some View {
        Button(action: handleTap) {
            Text(tag.name)
                .padding(.small)
                .background(tag.color)
                .clipShape(RoundedRectangle(cornerRadius: .small))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        print("detail")
    }
}
