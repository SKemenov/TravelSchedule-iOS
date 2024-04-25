//
//  MainSearchView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct MainSearchView: View {
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    private let dummyDirection = ["Departure", "Arrival"]

    private var isDepartureReady: Bool {
        !schedule.destinations[.departure].cityTitle.isEmpty && !schedule.destinations[.departure].stationTitle.isEmpty
    }

    private var isArrivalReady: Bool {
        !schedule.destinations[.arrival].cityTitle.isEmpty && !schedule.destinations[.arrival].stationTitle.isEmpty
    }

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0 ..< 2) { item in
                    let destinationLabel = schedule.destinations[item].cityTitle.isEmpty
                    ? dummyDirection[item]
                    : schedule.destinations[item].cityTitle + " (" + schedule.destinations[item].stationTitle + ")"
                    NavigationLink(value: ViewsRouter.cityView) {
                        HStack {
                            Text(destinationLabel)
                                .foregroundStyle(schedule.destinations[item].cityTitle.isEmpty ? .ypGray : .ypBlack)
                            Spacer()
                            // Image(systemName: "chevron.forward")
                        }
                        .padding(14)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        direction = item
                    })
                }
            }
            .background(.ypWhite)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            // .listStyle(.plain)

            ZStack {
                Circle()
                    .foregroundColor(.ypWhite)
                    .frame(width: 36)
                Button {
                    (
                        schedule.destinations[.departure], schedule.destinations[.arrival]
                    ) = (
                        schedule.destinations[.arrival], schedule.destinations[.departure]
                    )
                } label: {
                    Image.iconSearchSwap
                        .foregroundColor(.ypBlue)
                }
            }
        }
        .padding(16)
        .background(.ypBlue)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(height: 128)
        .padding(.top, 20)
        .padding(.horizontal, 16)

        if isDepartureReady && isArrivalReady {
            NavigationLink(value: ViewsRouter.routeView) {
                Text("Найти")
                    .font(.boldSmall)
                    .foregroundStyle(.ypWhite)
                    .frame(width: 150, height: 60)
                    .background(.ypBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(16)
            }
        }
        Spacer()
        // .navigationTitle("")
    }
}

#Preview {
    NavigationStack {
        MainSearchView(schedule: .constant(Schedule.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}
