//
//  Destination.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import Foundation

// MARK: - Struct
struct Destination: Hashable, Identifiable {
    var id = UUID()
    var cityTitle: String
    var stationTitle: String
}

// MARK: - Mock data
extension Destination {
    static var emptyDestination: Destination {
        Destination(cityTitle: "", stationTitle: "")
    }

    static let sampleData: [Destination] = [
        Destination(cityTitle: "", stationTitle: ""),
        Destination(cityTitle: "", stationTitle: "")
    ]
}
