//
//  FilterConnectionSectionView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct FilterConnectionSectionView: View {
    private let title = "Показывать варианты с пересадками"
    @Binding var currentFilter: Filter

    var body: some View {
        Text(title)
            .font(AppFonts.Bold.medium)
            .padding(AppSizes.Spacing.large)

        VStack(spacing: .zero) {
            Toggle("Да", isOn: $currentFilter.isWithTransfers)
                .setRowElement()
                .toggleStyle(.radioButton)

            Toggle("Нет", isOn: $currentFilter.isWithTransfers.not)
                .setRowElement()
                .toggleStyle(.radioButton)
        }
    }
}

#Preview {
    VStack {
        FilterConnectionSectionView(currentFilter: .constant(Filter.fullSearch))
        FilterConnectionSectionView(currentFilter: .constant(Filter.customSearch))
    }
}
