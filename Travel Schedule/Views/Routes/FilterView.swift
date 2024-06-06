//
//  FilterView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct FilterView: View {
    private let buttonTitle = "Применить"

    @Binding var filter: Filter

    @State var currentFilter = Filter()

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            FilterTimeSectionView(currentFilter: $currentFilter)

            FilterConnectionSectionView(currentFilter: $currentFilter)

            Spacer()

            if currentFilter != filter {
                Button {
                    filter = currentFilter
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ButtonTitleView(title: buttonTitle)
                }
                .setCustomButton(padding: .horizontal)
            }
        }
        .setCustomNavigationBar()
        .onAppear {
            currentFilter = filter
        }
    }
}

#Preview {
    NavigationStack {
        FilterView(filter: .constant(Filter.fullSearch))
    }
}

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
