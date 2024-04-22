//
//  City.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import Foundation

// MARK: - Struct
struct City: Hashable, Identifiable {
    var id = UUID()
    var title: String
}

// MARK: - Mock data
extension City {
    static let sampleData = [
        City(title: "Москва"),
        City(title: "Санкт-Петербург"),
        City(title: "Сочи"),
        City(title: "Горный Воздух"),
        City(title: "Краснодар"),
        City(title: "Казань"),
        City(title: "Омск")
    ]
}
