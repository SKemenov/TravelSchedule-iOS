//
//  View+Extensions.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

extension View {
    func setRowElement() -> some View {
        modifier(SetRowElement())
    }

    func setCustomNavBackButton() -> some View {
        modifier(SetCustomNavBackButton())
    }

    func setCustomNavigationBar(title: String = "") -> some View {
        modifier(SetCustomNavigationBar(title: title))
    }

    func setCustomButton(width: CGFloat? = nil, padding: Edge.Set) -> some View {
        modifier(SetCustomButton(width: width, padding: padding))
    }
}
