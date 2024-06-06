//
//  StoriesTabView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 04.06.2024.
//

import SwiftUI

struct StoriesTabView: View {
    // MARK: - Constants
    private let firstPage = 0

    // MARK: - Properties
    private var stories: [Story] { storiesList[initialIndex].stories }
    private var lastPage: Int { stories.count - 1 }

    @Binding var storiesList: [StoriesList]
    @Binding var initialIndex: Int
    @Binding var currentPage: Int

    // MARK: - View
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(stories.enumerated()), id: \.offset) { index, story in
                SingleStoryView(model: story)
                    .tag(index)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    StoriesTabView(
        storiesList: .constant(StoriesList.mockData),
        initialIndex: .constant(1),
        currentPage: .constant(0)
    )
}
