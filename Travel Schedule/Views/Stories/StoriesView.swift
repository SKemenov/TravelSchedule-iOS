//
//  StoriesView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 04.06.2024.
//

import SwiftUI
import Combine

struct StoriesView: View {
    // MARK: - Constants
    private let almostZero = 0.01
    private let full = 1.0
    private let firstIndex = 0
    private let firstPage = 0

    // MARK: - Properties
    private var lastIndex: Int { storiesList.count - 1 }
    private var timer: TimerConfiguration { .init(storiesCount: stories.count) }
    private var stories: [Story] { storiesList[initialIndex].stories }
    private var lastPage: Int { stories.count - 1 }

    @State var currentPage: Int = 0
    @State var currentProgress: CGFloat = 0

    @Binding var storiesList: [StoriesList]
    @Binding var initialIndex: Int

    @Environment(\.dismiss) var dismiss

    // MARK: - View
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(storiesList: $storiesList, initialIndex: $initialIndex, currentPage: $currentPage)
                .onChange(of: currentPage) { [currentPage] newValue in
                    didChangePage(oldPage: currentPage, newPage: newValue)
                }

            StoriesProgressBarView(storiesCount: stories.count, timerConfiguration: timer, progress: $currentProgress)
                .onChange(of: currentProgress) { newValue in
                    didChangeProgress(newProgress: newValue)
                }
        }
        .onTapGesture { location in
            didTapStory(at: location)
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    didSwipeDown(gesture: gesture)
                }
        )
    }
}

// MARK: - Private methods
private extension StoriesView {
    func didChangePage(oldPage: Int, newPage: Int) {
        let progress = timer.progress(for: newPage)
        guard oldPage != newPage, abs(progress - currentProgress) >= almostZero else { return }
        currentProgress = progress
    }

    func didChangeProgress(newProgress: CGFloat) {
        if currentProgress == full && newProgress == full {
            showNext()
        }
        let pageIndex = timer.index(for: newProgress)
        if pageIndex != currentPage {
            withAnimation {
                currentPage = pageIndex
            }
        }
    }

    func didTapStoryPage(at location: CGPoint) {
        let halfScreen = UIScreen.main.bounds.width / 2
        switch (currentPage, location.x) {
            case (firstPage, ...halfScreen):
                showPrevious()
            case (lastPage, halfScreen...):
                showNext()
            default:
                withAnimation {
                    currentPage = location.x < halfScreen
                    ? max(currentPage - 1, 0)
                    : min(currentPage + 1, pagesCount - 1)
                }
        }
    }

    func didSwipeDown(gesture: DragGesture.Value) {
        switch (gesture.translation.width, gesture.translation.height) {
            case (-30...30, 0...): handleDismiss()
            default: break
        }
    }

    func handleDismiss() {
        dismiss()
    }

    func showNext() {
        storiesList[initialIndex].isShowed = true
        if initialIndex == lastIndex && currentPage == lastPage {
            handleDismiss()
        } else {
            currentProgress = 0
            initialIndex += 1
        }
    }

    func showPrevious() {
        if currentPage > firstPage {
            currentPage -= 1
        }
        if initialIndex > firstIndex {
            initialIndex -= 1
            currentPage = lastPage
        }
    }
}

#Preview {
    StoriesView(storiesList: .constant(StoriesList.mockData), initialIndex: .constant(2))
}
