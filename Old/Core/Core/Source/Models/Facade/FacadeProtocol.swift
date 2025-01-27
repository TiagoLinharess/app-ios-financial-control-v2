//
//  Destination.swift
//  Router
//
//  Created by Tiago Linhares on 16/11/24.

import SwiftUI

public protocol FacadeProtocol: Hashable {
    associatedtype ContentView: View
    func getView() -> ContentView
}
