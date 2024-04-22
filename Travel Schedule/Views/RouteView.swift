//
//  RouteView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct RouteView: View {
    @Binding var schedule: Schedule

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text(schedule.destinations[.departure].cityTitle)
                Text("-")
                Text(schedule.destinations[.departure].stationTitle)
            }
            HStack {
                Text(schedule.destinations[.arrival].cityTitle)
                Text("-")
                Text(schedule.destinations[.arrival].stationTitle)
            }
        }
    }
}

#Preview {
    RouteView(schedule: .constant(Schedule.sampleData))
}
