//
//  SearchButtonView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct SearchButtonView: View {
    private let searchButtonTitle = "Найти"
    let destinations: [Destination]
    let route: ViewsRouter

    private var isDepartureReady: Bool {
        !destinations[.departure].cityTitle.isEmpty && !destinations[.departure].stationTitle.isEmpty
    }
    private var isArrivalReady: Bool {
        !destinations[.arrival].cityTitle.isEmpty && !destinations[.arrival].stationTitle.isEmpty
    }

    var body: some View {
        if isDepartureReady && isArrivalReady {
            NavigationLink(value: route) {
                Text(searchButtonTitle)
                    .font(.boldSmall)
                    .foregroundStyle(AppColors.Universal.white)
                    .frame(width: AppSizes.Width.searchButton, height: AppSizes.Height.searchButton)
                    .background(.ypBlue)
                    .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
                    .padding(AppSizes.Spacing.large)
            }
        }
    }

    init(for destinations: [Destination], showView route: ViewsRouter) {
        self.destinations = destinations
        self.route = route
    }
}

#Preview {
    SearchButtonView(for: Destination.sampleData, showView: ViewsRouter.cityView)
        .background(AppColors.Universal.red.opacity(0.5))
}
