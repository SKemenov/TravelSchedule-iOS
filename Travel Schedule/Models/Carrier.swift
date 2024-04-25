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
    var email: String
    var phone: String
}

extension Carrier {
    static let emptyData = Carrier(title: "", logoName: "", email: "", phone: "")

    static let sampleData: [Carrier] = [
        Carrier(title: "РЖД", logoName: "rzhd", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71"),
        Carrier(title: "ФГК", logoName: "fgk", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71"),
        Carrier(title: "Урал логистика", logoName: "ural", email: "i.lozgkina@yandex.ru", phone: "+7 (904) 329-27-71")
    ]
}
