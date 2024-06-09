//
//  SectionTitleView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 09.06.2024.
//

import SwiftUI

struct SectionTitleView: View {
    // MARK: - Constants
    let title: String

    // MARK: - View
    var body: some View {
        Text(title)
            .font(AppFonts.Bold.medium)
            .padding(AppSizes.Spacing.large)
    }
}

#Preview {
    SectionTitleView(title: "Departure Time")
}
