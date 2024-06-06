//
//  RootTabView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct RootTabView: View {
    @Binding var schedule: Schedule
    @Binding var darkMode: Bool
    @State var navPath: [ViewsRouter] = []
    @State var direction: Int = .departure
    @State var storiesList: [StoriesList] = StoriesList.mockData

    var body: some View {
        NavigationStack(path: $navPath) {
            TabView {
                SearchTabView(storiesList: $storiesList, schedule: $schedule, navPath: $navPath, direction: $direction)
                    .tabItem {
                        AppImages.Tabs.schedule
                    }
                SettingsView(darkMode: $darkMode)
                    .tabItem {
                        AppImages.Tabs.settings
                    }
            }
            .accentColor(AppColors.LightDark.black)
            .toolbar(.visible, for: .tabBar)
            .navigationDestination(for: ViewsRouter.self) { pathValue in
                switch pathValue {
                case .cityView:
                    CityView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .stationView:
                    StationView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .routeView:
                    RoutesListView(schedule: $schedule)
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    RootTabView(schedule: .constant(Schedule.sampleData), darkMode: .constant(false))
}
