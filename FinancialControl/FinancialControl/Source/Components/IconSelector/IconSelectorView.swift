//
//  IconSelectorView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 15/07/25.
//

import SharpnezDesignSystemSwiftUI
import SwiftUI

struct IconSelectorView: View {
    
    // MARK: Properties
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding var selectedIcon: SHIconType
    @Binding var isPresented: Bool
    
    // MARK: Init
    
    init(selectedIcon: Binding<SHIconType>, isPresented: Binding<Bool>) {
        self._selectedIcon = selectedIcon
        self._isPresented = isPresented
    }
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            SHContainerView(title: Localizable.Commons.selectIcon) {
                ScrollView {
                    SHFlowLayout {
                        ForEach(SHIconType.allCases, id: \.self) { iconType in
                            Button {
                                handleSelectIcon(at: iconType)
                            } label: {
                                SHIcon(icon: iconType)
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                                    .frame(width: .superBig, height: .superBig)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.small)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: handleClose) {
                        SHIcon(icon: .close)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                            .frame(width: .medium, height: .medium)
                    }
                }
            }
        }
    }
    
    // MARK: Private methods
    
    private func handleSelectIcon(at iconType: SHIconType) {
        selectedIcon = iconType
        handleClose()
    }
    
    private func handleClose() {
        isPresented = false
    }
}
