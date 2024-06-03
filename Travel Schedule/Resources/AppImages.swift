//
//  AppIcons.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

/// Collection of app's images
enum AppImages {
    /// Different states for `Checkbox` toggle style
    enum Checkbox {
        static let on = Image(systemName: "checkmark.square.fill")
        static let off = Image(systemName: "square")
    }
    /// Different states for `RadioButton` toggle style
    enum RadioButton {
        static let on = Image(systemName: "largecircle.fill.circle")
        static let off = Image(systemName: "circle")
    }
    /// Images for Tabs
    enum Tabs {
        static let schedule = Image("schedule").renderingMode(.template)
        static let settings = Image("settings").renderingMode(.template)
    }
    /// App's Icons
    enum Icons {
        static let cancel = Image(systemName: "xmark.circle.fill")
        static let arrow = Image(systemName: "arrow.forward")
        static let forward = Image(systemName: "chevron.forward")
        static let backward = Image(systemName: "chevron.backward")
        static let search = Image(systemName: "magnifyingglass")
        static let swap = Image(systemName: "arrow.2.squarepath")
        static let marker = Image(systemName: "circle.fill")
    }
}
