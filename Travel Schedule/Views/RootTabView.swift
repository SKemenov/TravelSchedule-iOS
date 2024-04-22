//
//  RootTabView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 19.04.2024.
//

import SwiftUI

struct RootTabView: View {
    @Binding var schedule: Schedule
    @State var navPath: [Screens] = []
    @State var direction: Int = .departure

    var body: some View {
        NavigationStack(path: $navPath) {
            TabView {
                MainSearchView(schedule: $schedule, navPath: $navPath, direction: $direction)
                    .tabItem {
                        Label("Schedule", systemImage: "calendar")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            .accentColor(.black)
            .toolbar(.visible, for: .tabBar)
            .navigationDestination(for: Screens.self) { pathValue in
                switch pathValue {
                case .cityView:
                    CityView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .stationView:
                    StationView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .routeView:
                    RouteView(schedule: $schedule)
                        .toolbar(.hidden, for: .tabBar)
                case .agreementView:
                    AgreementView()
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    RootTabView(schedule: .constant(Schedule.sampleData))
}
