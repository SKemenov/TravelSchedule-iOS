//
//  MainSearchView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct MainSearchView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [Screens]
    @Binding var direction: Int
    private let dummyDirection = ["Departure", "Arrival"]

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                ForEach(0 ..< 2) { item in
                    let destinationLabel = schedule.destinations[item].cityTitle.isEmpty
                    ? dummyDirection[item]
                    : schedule.destinations[item].cityTitle + " (" + schedule.destinations[item].stationTitle + ")"
                    NavigationLink(value: Screens.cityView) {
                        HStack {
                            Text(destinationLabel)
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                        .padding()
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        direction = item
                        print(#fileID, "direction code", direction)
                    })
                }
            }
            .listStyle(.plain)


            VStack {
                Button {
                    let swap = schedule.destinations[.departure]
                    print(swap)
                    schedule.destinations[.departure] = schedule.destinations[.arrival]
                    schedule.destinations[.arrival] = swap
                } label: {
                    Label("Reverse", systemImage: "person.3")
                }

                NavigationLink(value: Screens.routeView) {
                    Label("Search", systemImage: "pencil")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        MainSearchView(schedule: .constant(Schedule.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}


extension Int {
    static let departure = 0
    static let arrival = 1
}
