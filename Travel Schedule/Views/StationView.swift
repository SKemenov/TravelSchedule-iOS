//
//  StationView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct StationView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [Screens]
    @Binding var direction: Int

    var body: some View {
        VStack {
            ForEach($schedule.stations) { $station in
                Button {
                    schedule.destinations[direction].stationTitle = station.title
                    print(
                        #fileID,
                        "direction code",
                        direction,
                        "City",
                        schedule.destinations[direction].cityTitle,
                        "Station",
                        schedule.destinations[direction].stationTitle
                    )
                    navPath.removeAll()
                } label: {
                    RowSearchView(rowString: station.title)
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    StationView(
        schedule: .constant(Schedule.sampleData),
        navPath: .constant([]),
        direction: .constant(.departure)
    )
}
