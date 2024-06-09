//
//  Story.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 06.06.2024.
//

import Foundation

// MARK: - Model structure
struct Story: Identifiable {
    var id = UUID()
    var imageName: String
    var isShowed: Bool = false
    var title: String
    var storyPages: [StoryPage]
}

// MARK: - Model mock data
extension Story {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized

    static let mockData: [Story] = [
        Story(imageName: "preview1", title: title, storyPages: StoryPage.mockData1),
        Story(imageName: "preview2", title: title, storyPages: StoryPage.mockData2),
        Story(imageName: "preview3", title: title, storyPages: StoryPage.mockData3),
        Story(imageName: "preview4", title: title, storyPages: StoryPage.mockData4),
        Story(imageName: "preview5", title: title, storyPages: StoryPage.mockData5),
        Story(imageName: "preview6", title: title, storyPages: StoryPage.mockData6),
        Story(imageName: "preview7", title: title, storyPages: StoryPage.mockData7),
        Story(imageName: "preview8", title: title, storyPages: StoryPage.mockData8),
        Story(imageName: "preview9", title: title, storyPages: StoryPage.mockData9)
    ]
}
