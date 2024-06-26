//
//  FilterConnectionSectionView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct FilterConnectionSectionView: View {
    // MARK: - Constants
    private let title = "Показывать варианты с пересадками"

    // MARK: - Properties
    @Binding var currentFilter: Filter

    // MARK: - View
    var body: some View {
        SectionTitleView(title: title)

        RadioButtonView(isOn: $currentFilter.isWithTransfers)
    }
}

#Preview {
    VStack {
        FilterConnectionSectionView(currentFilter: .constant(Filter.fullSearch))
        FilterConnectionSectionView(currentFilter: .constant(Filter.customSearch))
    }
}
