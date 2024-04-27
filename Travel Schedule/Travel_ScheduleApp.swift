//
//  Travel_ScheduleApp.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 10.03.2024.
//

import SwiftUI

@main
struct Travel_ScheduleApp: App {
    @State private var schedule = Schedule.sampleData
    @State private var darkMode = false

    var body: some Scene {
        WindowGroup {
            RootTabView(schedule: $schedule, darkMode: $darkMode)
                .environment(\.colorScheme, darkMode ? .dark : .light)
        }
    }
}
