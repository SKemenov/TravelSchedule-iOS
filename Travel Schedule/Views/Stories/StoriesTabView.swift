//
//  StoriesTabView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 04.06.2024.
//

import SwiftUI

struct StoriesTabView: View {
    // MARK: - Properties
    @Binding var stories: [Story]
    @Binding var storyIndex: Int
    @Binding var currentPage: Int

    // MARK: - View
    var body: some View {
        TabView(selection: $storyIndex) {
            ForEach(Array(stories.enumerated()), id: \.offset) { storyIndex, story in
                TabView(selection: $currentPage) {
                    ForEach(Array(story.storyPages.enumerated()), id: \.offset) { pageIndex, page in
                        SingleStoryView(model: page)
                            .tag(pageIndex)
                    }
                }
                .tag(storyIndex)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    StoriesTabView(
        stories: .constant(Story.mockData),
        storyIndex: .constant(1),
        currentPage: .constant(0)
    )
}
