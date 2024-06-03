//
//  DestinationsListView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct DestinationsListView: View {
    let destinations: [Destination]
    private let dummyDirection = ["Откуда", "Куда"]
    @Binding var directionId: Int

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            ForEach(Array(destinations.enumerated()), id: \.offset) { index, destination in
                let city = destination.cityTitle
                let station = destination.stationTitle.isEmpty
                ? ""
                : " (" + destination.stationTitle + ")"
                let destinationLabel = city.isEmpty
                ? dummyDirection[index]
                : city + station
                return NavigationLink(value: ViewsRouter.cityView) {
                    HStack {
                        Text(destinationLabel)
                            .foregroundStyle(city.isEmpty ? AppColors.Universal.gray : AppColors.Universal.black)
                        Spacer()
                    }
                    .padding(AppSizes.Spacing.large)
                    .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.searchingRow)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    directionId = index
                })
            }
        }
        .background(.ypWhite)
        .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.xLarge))
    }
}


#Preview {
    VStack {
        DestinationsListView(destinations: Destination.emptyDestination, directionId: .constant(0))
        DestinationsListView(destinations: Destination.sampleData, directionId: .constant(0))
    }
    .padding()
    .background(AppColors.Universal.blue)
}
