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

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Image(carrier.logoName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 38, height: 38)
                    .padding(.leading, 14)
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text(carrier.title)
                            .font(.regMedium)
                            .foregroundStyle(.ypBlack)
                        if !route.isDirect {
                            Text("С пересадкой в \(route.connectionStation)")
                                .font(.regSmall)
                                .foregroundStyle(.ypRed)
                        }
                    }
                    Spacer()
                    Text(route.date)
                        .font(.regSmall)
                        .foregroundStyle(.ypBlack)
                }
            }
            .padding(.top, 14)
            .padding(.trailing, 7)

            HStack(spacing: 0) {
                Text(route.departureTime)
                    .font(.regMedium)
                    .padding(.trailing, 4)
                    .background(.ypLightGray)
                Spacer()
                Text("\(route.durationTime) часов")
                    .font(.regSmall)
                    .padding(.horizontal, 5)
                    .background(.ypLightGray)
                Spacer()
                Text(route.arrivalTime)
                    .font(.regMedium)
                    .padding(.leading, 4)
                    .background(.ypLightGray)
            }
            .background(
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.ypGray)
            )
            .foregroundStyle(.ypBlack)
            .padding(14)
            .frame(maxWidth: .infinity, maxHeight: 48)
        }
        .background(.ypLightGray)
        .frame(maxWidth: .infinity, maxHeight: 104)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    RouteView(route: Schedule.sampleData.routes[0], carrier: Carrier.sampleData[0])
}
