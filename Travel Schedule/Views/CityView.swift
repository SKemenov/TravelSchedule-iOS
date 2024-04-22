//
//  CityView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct CityView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [Screens]
    @Binding var direction: Int

    var body: some View {
        VStack {
            ForEach($schedule.cities) { $city in
                NavigationLink(value: Screens.stationView) {
                    RowSearchView(rowString: city.title) // Text(city.title)
                }
                    .simultaneousGesture(TapGesture().onEnded {
                        schedule.destinations[direction].cityTitle = city.title
                        print(#fileID, "direction code", direction, "City", schedule.destinations[direction].cityTitle)
                    })
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        CityView(schedule: .constant(Schedule.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}
