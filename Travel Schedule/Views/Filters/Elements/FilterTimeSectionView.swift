//
//  FilterTimeSectionView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct FilterTimeSectionView: View {
    private let title = "Время отправления"
    @Binding var currentFilter: Filter

    var body: some View {
        Text(title)
            .font(AppFonts.Bold.medium)
            .padding(AppSizes.Spacing.large)

        CheckboxView(type: .morning, filter: $currentFilter.isMorning)
        CheckboxView(type: .afternoon, filter: $currentFilter.isAfternoon)
        CheckboxView(type: .evening, filter: $currentFilter.isEvening)
        CheckboxView(type: .night, filter: $currentFilter.isAtNight)
    }
}

#Preview {
    FilterTimeSectionView(currentFilter: .constant(Filter.customSearch))
}
