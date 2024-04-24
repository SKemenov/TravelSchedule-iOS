//
//  RoutesListView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 23.04.2024.
//

import SwiftUI

struct RoutesListView: View {
    @Binding var schedule: Schedule
    @State var currentFilter = Filter()

    private var departure: String {
        schedule.destinations[.departure].cityTitle + " (" + schedule.destinations[.departure].stationTitle + ") "
    }

    private var arrival: String {
        schedule.destinations[.arrival].cityTitle + " (" + schedule.destinations[.arrival].stationTitle + ") "
    }

    private var filteredRoutes: [Route] {
        let complexRoutes = currentFilter.isWithTransfers
            ? schedule.routes
            : schedule.routes.filter { $0.isDirect == true }
        var allRoutes = currentFilter.isAtNight
            ? complexRoutes.filter { $0.departureTime.starts(with: /0[0-5]/) }
            : []
        allRoutes += currentFilter.isMorning
        ? complexRoutes.filter { $0.departureTime.starts(with: /0[6-9]/) || $0.departureTime.starts(with: /1[0-1]/) }
        : []
        allRoutes += currentFilter.isAfternoon
            ? complexRoutes.filter { $0.departureTime.starts(with: /1[2-8]/) }
            : []
        allRoutes += currentFilter.isEvening
            ? complexRoutes.filter { $0.departureTime.starts(with: /19/) || $0.departureTime.starts(with: /2[0-4]/) }
            : []
        return allRoutes.sorted { $0.date < $1.date }
    }

    var body: some View {
        VStack {
            Text(departure) + Text(Image.iconArrow) + Text(arrival)
            List {
                if filteredRoutes.isEmpty {
                    Text("Вариантов нет")
                } else {
                    ForEach(filteredRoutes) { route in
                        if let carrier = schedule.carriers.first(where: { $0.id == route.carrierID }) {
                            // NavigationLink(value: ViewsRouter.carrierView) {
                            NavigationLink {
                                CarrierView(carrier: carrier)
                            } label: {
                                RouteView(route: route, carrier: carrier)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) {
            //            NavigationLink(value: ViewsRouter.filterView) {
            NavigationLink {
                FilterView(filter: $currentFilter)
            } label: {
                Text(currentFilter == Filter.fullSearch ? "Уточнить время" : "Уточнить время *")
            }
        }
//        .onAppear {
//            currentFilter = schedule.filter
//        }
    }
}

#Preview {
    NavigationStack {
        RoutesListView(
            schedule: .constant(Schedule.sampleData)
        )
    }
}
