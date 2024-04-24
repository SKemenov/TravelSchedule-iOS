//
//  Schedule.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import Foundation

// MARK: - Struct
struct Schedule: Hashable, Identifiable {
    var id = UUID()
    var cities: [City]
    var stations: [Station]
    var destinations: [Destination]
    var routes: [Route]
    var carriers: [Carrier]
    // var filter: Filter
}

// MARK: - Mock data
extension Schedule {
    static let sampleData = Schedule(
        cities: City.sampleData,
        stations: Station.sampleData,
        destinations: Destination.emptyDestination,
        routes: Route.sampleData,
        carriers: Carrier.sampleData // ,
        // filter: Filter.fullSearch
    )
}
