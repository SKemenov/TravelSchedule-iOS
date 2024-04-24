//
//  Carrier.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 23.04.2024.
//

import Foundation

struct Carrier: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var logoName: String
}

extension Carrier {
    static let emptyData = Carrier(title: "", logoName: "")

    static let sampleData: [Carrier] = [
        Carrier(title: "РЖД", logoName: "rzhd"),
        Carrier(title: "ФГК", logoName: "fgk"),
        Carrier(title: "Урал логистика", logoName: "ural")
    ]
}
