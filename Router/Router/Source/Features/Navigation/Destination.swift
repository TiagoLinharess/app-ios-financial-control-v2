//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 14/11/24.
//

import SwiftUI

public protocol DestinationProtocol: Hashable {
    associatedtype ContentView: View
    var title: String { get }
    var iconName: String { get }
    var view: ContentView { get }
}
