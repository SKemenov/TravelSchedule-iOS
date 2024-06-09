//
//  Binding+Extensions.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 09.06.2024.
//

import SwiftUI

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
