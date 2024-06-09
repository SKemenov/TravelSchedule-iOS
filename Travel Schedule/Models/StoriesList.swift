//
//  StoriesList.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 06.06.2024.
//

import Foundation

// MARK: - Model structure
struct StoriesList: Identifiable {
    var id = UUID()
    var previewImageName: String
    var isShowed: Bool = false
    var title: String
    var storyPages: [StoryPage]
}

// MARK: - Model mock data
extension StoriesList {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized

    static var mockData: [StoriesList] = [
        StoriesList(previewImageName: "preview1", title: title, storyPages: StoryPage.mockData1),
        StoriesList(previewImageName: "preview2", title: title, storyPages: StoryPage.mockData2),
        StoriesList(previewImageName: "preview3", title: title, storyPages: StoryPage.mockData3),
        StoriesList(previewImageName: "preview4", title: title, storyPages: StoryPage.mockData4),
        StoriesList(previewImageName: "preview5", title: title, storyPages: StoryPage.mockData5),
        StoriesList(previewImageName: "preview6", title: title, storyPages: StoryPage.mockData6),
        StoriesList(previewImageName: "preview7", title: title, storyPages: StoryPage.mockData7),
        StoriesList(previewImageName: "preview8", title: title, storyPages: StoryPage.mockData8),
        StoriesList(previewImageName: "preview9", title: title, storyPages: StoryPage.mockData9)
    ]
}
