//
//  FilterView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct FilterView: View {
    @Binding var filter: Filter
    // @Binding var navPath: [ViewsRouter]
    // @State var initialFilter = Filter()
    @State var currentFilter = Filter()
    // swiftlint:disable:next attributes
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading) {
            Text("Время отправления")
            Toggle("Утро 06:00 - 12:00", isOn: $currentFilter.isMorning)
                .toggleStyle(.automatic)
            Toggle("День 12:00 - 18:00", isOn: $currentFilter.isAfternoon)
            Toggle("Вечер 18:00 - 00:00", isOn: $currentFilter.isEvening)
            Toggle("Ночь 00:00 - 06:00", isOn: $currentFilter.isAtNight)

            Text("Показывать варианты с пересадками")
            Toggle("yes / no", isOn: $currentFilter.isWithTransfers)
            Spacer()
            if currentFilter != filter {
                Button {
                    filter = currentFilter
                    // navPath.removeLast()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Применить")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // self.initialFilter = self.filter[.initial]
            currentFilter = filter
        }
    }
}

#Preview {
    NavigationStack {
        FilterView(filter: .constant(Filter.fullSearch))
    }
}
