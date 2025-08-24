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
    
    private let tag: TagDataModel
    @EnvironmentObject private var router: Router
    
    // MARK: Init
    
    init(tag: TagDataModel) {
        self.tag = tag
    }
    
    // MARK: Body
    
    public var body: some View {
        Button(action: handleTap) {
            TagItemView(
                name: tag.name,
                backgroundColor: tag.backgroundColor,
                textColor: tag.textColor
            )
        }
        .buttonStyle(.plain)
    }
    
    // MARK: Private methods
    
    private func handleTap() {
        router.push(.tagForm(tag))
    }
}
