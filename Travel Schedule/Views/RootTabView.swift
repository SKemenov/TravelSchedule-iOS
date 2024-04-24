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

    var body: some View {
        NavigationStack(path: $navPath) {
            TabView {
                MainSearchView(schedule: $schedule, navPath: $navPath, direction: $direction)
                    .tabItem {
                        Image.iconTabSearch
                    }
                SettingsView(darkMode: $darkMode)
                    .tabItem {
                        Image.iconTabSettings
                    }
            }
            .accentColor(.ypBlackDuo)
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
                    //                case .agreementView:
                    //                    AgreementView()
                    //                        .toolbar(.hidden, for: .tabBar)
                    //                case .filterView:
                    //                    FilterView(filter: $schedule.filter, navPath: $navPath)
                    //                        .toolbar(.hidden, for: .tabBar)
                    //                case .carrierView:
                    //                    AgreementView()
                    //                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    RootTabView(schedule: .constant(Schedule.sampleData), darkMode: .constant(false))
}
