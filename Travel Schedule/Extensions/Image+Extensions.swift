//
//  Image+Extensions.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import SwiftUI

extension Image {
    // static let iconTabSearch = Image(systemName: "arrow.up.message.fill")
    // static let iconTabSettings = Image(systemName: "gearshape.fill")
    static let iconTabSearch = Image("Schedule").renderingMode(.template)
    static let iconTabSettings = Image("Settings").renderingMode(.template)

    static let iconSearchSwap = Image(systemName: "arrow.2.squarepath")
    static let iconSearching = Image(systemName: "magnifyingglass")
    static let iconSearCancel = Image(systemName: "xmark.circle.fill")
    static let iconBackward = Image(systemName: "chevron.backward")
    static let iconForward = Image(systemName: "chevron.forward")


    static let imageServerError = Image("xmark.circle.fill")
}
