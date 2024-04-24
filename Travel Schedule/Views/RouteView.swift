//
//  RouteView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct RouteView: View {
    @State var route: Route
    @State var carrier: Carrier
    //    {
    //        Carrier.sampleData.first { $0.id == schedule.routes[index].carrierID } ?? Carrier.emptyData
    //    }

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text(carrier.logoName)
                HStack {
                    VStack(alignment: .leading) {
                        Text(carrier.title)
                        Text(route.isDirect ? "" : "С пересадкой в \(route.connectionStation)")
                    }
                    Spacer()
                    Text(route.date)
                }
            }
            HStack {
                Text(route.departureTime)
                Spacer()
                Text("\(route.durationTime) часов")
                Spacer()
                Text(route.arrivalTime)
            }
        }
    }
}

#Preview {
    RouteView(route: Schedule.sampleData.routes[0], carrier: Carrier.sampleData[0])
}
