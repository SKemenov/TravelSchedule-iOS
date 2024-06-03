//
//  AppSizes.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 02.06.2024.
//

import SwiftUI

/// Collection of app's sizes
enum AppSizes {
    /// CGFloat values for `cornerRadius`
    enum CornerRadius {
        /// CGFloat `4.0`
        static let xSmall: CGFloat = 4.0
        /// CGFloat `8.0`
        static let small: CGFloat = 8.0
        /// CGFloat `12.0`
        static let medium: CGFloat = 12.0
        /// CGFloat `16.0`
        static let large: CGFloat = 16.0
        /// CGFloat `20.0`
        static let xLarge: CGFloat = 20.0
        /// CGFloat `24.0`
        static let xxLarge: CGFloat = 24.0
        /// Custom `cornerRadius` for specific UI elements
        enum Custom {
            /// CGFloat `3.0`
            static let progressBar: CGFloat = 3.0
            /// CGFloat `10.0`
            static let searchBar: CGFloat = 10.0
        }
    }

    /// CGFloat values for `padding` and `spacing`
    enum Spacing {
        /// Spacer `4.0`
        static let xSmall: CGFloat = 4.0
        /// Spacer `8.0`
        static let small: CGFloat = 8.0
        /// Spacer `12.0`
        static let medium: CGFloat = 12.0
        /// Spacer `16.0`
        static let large: CGFloat = 16.0
        /// Spacer `20.0`
        static let xLarge: CGFloat = 20.0
        /// Spacer `24.0`
        static let xxLarge: CGFloat = 24.0
    }

    /// CGFloat values equal for both `width` and `height`
    enum Size {
        /// CGFloat `8.0`
        static let marker: CGFloat = 8.0
        /// CGFloat `17.0`
        static let icon: CGFloat = 17.0
        /// CGFloat `24.0`
        static let toggle: CGFloat = 24.0
        /// CGFloat `36.0`
        static let swappingButton: CGFloat = 36.0
        /// CGFloat `38.0`
        static let logo: CGFloat = 38.0
    }

    /// CGFloat values equal for both `line` and `border`
    enum Line {
        /// CGFloat `1.0`
        static let small: CGFloat = 1.0
        /// CGFloat `4.0`
        static let large: CGFloat = 4.0
    }

    /// CGFloat values for elements'`height` size
    enum Height {
        /// CGFloat `6.0`
        static let progressBar: CGFloat = 6.0
        /// CGFloat `29.0`
        static let carrierTitle: CGFloat = 29.0
        /// CGFloat `36.0`
        static let searchBar: CGFloat = 36.0
        /// CGFloat `44.0`
        static let about: CGFloat = 44.0
        /// CGFloat `48.0`
        static let searchingRow: CGFloat = 48.0
        /// CGFloat `48.0`
        static let timeLine: CGFloat = 48.0
        /// CGFloat `60.0`
        static let row: CGFloat = 60.0
        /// CGFloat `60.0`
        static let searchButton: CGFloat = 60.0
        /// CGFloat `104.0`
        static let carrierFullLogo: CGFloat = 104.0
        /// CGFloat `104.0`
        static let route: CGFloat = 104.0
        /// CGFloat `128.0`
        static let searchingForm: CGFloat = 128.0
        /// CGFloat `140.0`
        static let storyPreview: CGFloat = 140.0
        /// CGFloat `188.0`
        static let stories: CGFloat = 188.0
    }

    /// CGFloat values for elements'`width` size
    enum Width {
        /// CGFloat `92.0`
        static let storyPreview: CGFloat = 92.0
        /// CGFloat `150.0`
        static let searchButton: CGFloat = 150.0
    }
}
