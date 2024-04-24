//
//  CarrierView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct CarrierView: View {
    @State var carrier: Carrier
    // @Binding var carrier: Carrier

    var body: some View {
        VStack {
            Text(carrier.logoName)
            Text("ОАО «\(carrier.title)»")
            Text("E-mail")
            Text("\(carrier.id)")
            Text("Телефон")
            Text("\(carrier.id)")
            Spacer()
        }
        .navigationTitle("ИНформация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CarrierView(carrier: Carrier.sampleData[0])
        // CarrierView(carrier: .constant(Carrier.sampleData[0]))
    }
}
