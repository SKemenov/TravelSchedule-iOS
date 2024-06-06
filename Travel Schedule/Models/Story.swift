//
//  Story.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import Foundation

// MARK: - Model structure
struct Story: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

// MARK: - Model mock data
extension Story {
    static let title = Array(repeating: "title", count: 7).joined(separator: " ").capitalized
    static let description = Array(repeating: "text", count: 20).joined(separator: " ")

    static let mockData1: [Story] = [
        Story(imageName: "big1", title: title, description: description),
        Story(imageName: "big2", title: title, description: description)
    ]
    static let mockData2: [Story] = [
        Story(imageName: "big3", title: title, description: description),
        Story(imageName: "big4", title: title, description: description)
    ]
    static let mockData3: [Story] = [
        Story(imageName: "big5", title: title, description: description),
        Story(imageName: "big6", title: title, description: description)
    ]
    static let mockData4: [Story] = [
        Story(imageName: "big7", title: title, description: description),
        Story(imageName: "big8", title: title, description: description)
    ]
    static let mockData5: [Story] = [
        Story(imageName: "big9", title: title, description: description),
        Story(imageName: "big10", title: title, description: description)
    ]
    static let mockData6: [Story] = [
        Story(imageName: "big11", title: title, description: description),
        Story(imageName: "big12", title: title, description: description)
    ]
    static let mockData7: [Story] = [
        Story(imageName: "big13", title: title, description: description),
        Story(imageName: "big14", title: title, description: description)
    ]
    static let mockData8: [Story] = [
        Story(imageName: "big15", title: title, description: description),
        Story(imageName: "big16", title: title, description: description)
    ]
    static let mockData9: [Story] = [
        Story(imageName: "big17", title: title, description: description),
        Story(imageName: "big18", title: title, description: description)
    ]
}
