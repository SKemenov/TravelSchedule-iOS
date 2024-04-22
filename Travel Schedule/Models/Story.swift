//
//  Story.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 22.04.2024.
//

import Foundation

struct Story: Hashable, Identifiable {
    var id = UUID()
    let previewImageName: String
    let pageImageNames: [String]
    let title: String
    let text: String
    let isRead: Bool
}

extension Story {
    static let sampleData = [
        Story(
            previewImageName: "preview1",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: false
        ),
        Story(
            previewImageName: "preview2",
            pageImageNames: ["big2-1", "big2-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: false
        ),
        Story(
            previewImageName: "preview3",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview4",
            pageImageNames: ["big2-1", "big2-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview5",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview6",
            pageImageNames: ["big2-1", "big2-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview7",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview8",
            pageImageNames: ["big2-1", "big2-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        ),
        Story(
            previewImageName: "preview9",
            pageImageNames: ["big1-1", "big1-2"],
            title: "Text Text",
            text: "Text Text Text Text Text Text Text Text",
            isRead: true
        )
    ]
}
