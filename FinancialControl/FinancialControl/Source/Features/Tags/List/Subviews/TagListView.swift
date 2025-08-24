//
//  TagListView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 18/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct TagListView: View {
    
    // MARK: Properties
    
    private let tags: [TagDataModel]
    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: Init
    
    init(tags: [TagDataModel]) {
        self.tags = tags
    }
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: .extraSmall) {
                SHFlowLayout {
                    ForEach(tags) { tag in
                        TagListItemView(tag: tag)
                    }
                }
            }
            .padding(.small)
        }
    }
}
