//
//  SearchTabView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 25.04.2024.
//

import SwiftUI

struct SearchTabView: View {
    @Binding var storiesList: [StoriesList]
    @Binding var schedule: Schedule
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int

    var body: some View {
        VStack(spacing: .zero) {
            PreviewStoriesView(storiesList: $storiesList)
            MainSearchView(schedule: $schedule, navPath: $navPath, directionId: $direction)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SearchTabView(
            storiesList: .constant(StoriesList.mockData),
            schedule: .constant(Schedule.sampleData),
            navPath: .constant([]),
            direction: .constant(0)
        )
    }
}
