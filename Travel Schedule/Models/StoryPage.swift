//
//  Story.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import Foundation

// MARK: - Model structure
struct StoryPage: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

// MARK: - Model mock data
extension StoryPage {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized
    static let description = Array(repeating: "text", count: 20).joined(separator: " ")

    static let mockData1: [StoryPage] = [
        StoryPage(imageName: "big1", title: title, description: description),
        StoryPage(imageName: "big2", title: title, description: description)
    ]
    static let mockData2: [StoryPage] = [
        StoryPage(imageName: "big3", title: title, description: description),
        StoryPage(imageName: "big4", title: title, description: description)
    ]
    static let mockData3: [StoryPage] = [
        StoryPage(imageName: "big5", title: title, description: description),
        StoryPage(imageName: "big6", title: title, description: description)
    ]
    static let mockData4: [StoryPage] = [
        StoryPage(imageName: "big7", title: title, description: description),
        StoryPage(imageName: "big8", title: title, description: description)
    ]
    static let mockData5: [StoryPage] = [
        StoryPage(imageName: "big9", title: title, description: description),
        StoryPage(imageName: "big10", title: title, description: description)
    ]
    static let mockData6: [StoryPage] = [
        StoryPage(imageName: "big11", title: title, description: description),
        StoryPage(imageName: "big12", title: title, description: description)
    ]
    static let mockData7: [StoryPage] = [
        StoryPage(imageName: "big13", title: title, description: description),
        StoryPage(imageName: "big14", title: title, description: description)
    ]
    static let mockData8: [StoryPage] = [
        StoryPage(imageName: "big15", title: title, description: description),
        StoryPage(imageName: "big16", title: title, description: description)
    ]
    static let mockData9: [StoryPage] = [
        StoryPage(imageName: "big17", title: title, description: description),
        StoryPage(imageName: "big18", title: title, description: description)
    ]
}
