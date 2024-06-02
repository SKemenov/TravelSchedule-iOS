//
//  AppFonts.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 02.06.2024.
//

import SwiftUI

/// Collection of app's fonts
enum AppFonts {
    /// Different sizes for `Regular` weight
    enum regular {
        /// `Regular`, size `12`
        static let small = Font.system(size: 12, weight: .regular)

        /// `Regular`, size `17`
        static let medium = Font.system(size: 17, weight: .regular)

        /// `Regular`, size `20`
        static let large = Font.system(size: 20, weight: .regular)
    }

    /// Different sizes for `Bold` weight
    enum Bold {
        /// `Bold`, size `17`
        static let small = Font.system(size: 17, weight: .bold)

        /// `Bold`, size `24`
        static let medium = Font.system(size: 24, weight: .bold)

        /// `Bold`, size `34`
        static let large = Font.system(size: 34, weight: .bold)
    }
}
