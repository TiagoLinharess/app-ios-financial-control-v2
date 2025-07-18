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
    
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var model: Tag
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: .extraSmall) {
                SHFlowLayout {
                    ForEach(model.tags) { tag in
                        TagListItemView(tag: tag)
                    }
                }
            }
            .padding(.small)
        }
    }
}
