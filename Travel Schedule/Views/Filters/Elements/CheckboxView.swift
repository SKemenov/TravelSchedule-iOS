//
//  CheckboxView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct CheckboxView: View {
    enum CheckboxType {
        case morning, afternoon, evening, night

        var title: String {
            switch self {
                case .morning:
                    return String(localized: "Утро 06:00 - 12:00")
                case .afternoon:
                    return String(localized: "День 12:00 - 18:00")
                case .evening:
                    return String(localized: "Вечер 18:00 - 00:00")
                case .night:
                    return String(localized: "Ночь 00:00 - 06:00")
            }
        }
    }
    let type: CheckboxType

    @Binding var filter: Bool

    var body: some View {
        Toggle(type.title, isOn: $filter)
            .setRowElement()
            .toggleStyle(.checkBox)
    }
}

#Preview {
    VStack {
        CheckboxView(type: .morning, filter: .constant(Filter.fullSearch.isMorning))
        CheckboxView(type: .morning, filter: .constant(Filter.customSearch.isMorning))
    }
}
