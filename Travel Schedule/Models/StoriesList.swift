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
    var stories: [Story]
}

// MARK: - Model mock data
extension StoriesList {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized

    static var mockData: [StoriesList] = [
        StoriesList(previewImageName: "preview1", title: title, stories: Story.mockData1),
        StoriesList(previewImageName: "preview2", title: title, stories: Story.mockData2),
        StoriesList(previewImageName: "preview3", title: title, stories: Story.mockData3),
        StoriesList(previewImageName: "preview4", title: title, stories: Story.mockData4),
        StoriesList(previewImageName: "preview5", title: title, stories: Story.mockData5),
        StoriesList(previewImageName: "preview6", title: title, stories: Story.mockData6),
        StoriesList(previewImageName: "preview7", title: title, stories: Story.mockData7),
        StoriesList(previewImageName: "preview8", title: title, stories: Story.mockData8),
        StoriesList(previewImageName: "preview9", title: title, stories: Story.mockData9)
    ]
}
