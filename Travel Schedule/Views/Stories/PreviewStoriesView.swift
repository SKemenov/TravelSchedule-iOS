//
//  StoriesListView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 23.04.2024.
//

import SwiftUI

struct PreviewStoriesView: View {
    // MARK: - Constants
    private let rows = [GridItem(.flexible())]

    // MARK: - Properties
    @Binding var storiesList: [StoriesList]

    @State var isStoriesShowing = false
    @State var initialIndex = 0

    // MARK: - View
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: AppSizes.Spacing.medium) {
                ForEach(Array(storiesList.enumerated()), id: \.offset) { index, story in
                    SinglePreviewStoryView(previewStory: story)
                        .onTapGesture {
                            isStoriesShowing = true
                            initialIndex = index
                        }
                        .fullScreenCover(isPresented: $isStoriesShowing, onDismiss: didDismiss) {
                            StoriesFlowView(storiesList: $storiesList, initialIndex: $initialIndex)
                        }
                }
            }
            .padding(.horizontal, AppSizes.Spacing.large)
            .padding(.vertical, AppSizes.Spacing.xxLarge)
        }
        .frame(height: AppSizes.Height.stories)
    }
}

private extension PreviewStoriesView {
    func didDismiss() {
        isStoriesShowing = false
    }
}

#Preview {
    PreviewStoriesView(storiesList: .constant(StoriesList.mockData))
}
