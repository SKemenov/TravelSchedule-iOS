//
//  FilterTimeSectionView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct FilterTimeSectionView: View {
    // MARK: - Constants
    private let title = "Время отправления"

    // MARK: - Properties
    @Binding var currentFilter: Filter

    // MARK: - View
    var body: some View {
        SectionTitleView(title: title)

        CheckboxView(type: .morning, isOn: $currentFilter.isMorning)
        CheckboxView(type: .afternoon, isOn: $currentFilter.isAfternoon)
        CheckboxView(type: .evening, isOn: $currentFilter.isEvening)
        CheckboxView(type: .night, isOn: $currentFilter.isAtNight)
    }
}

#Preview {
    FilterTimeSectionView(currentFilter: .constant(Filter.customSearch))
}
