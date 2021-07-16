//
//  Article.swift
//  Domain
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Foundation

public struct Article {
    var title: String
    var articleURL: URL
    var imageURL: URL
    var elapsedTime: TimeInterval

    public init(title: String,
                articleURL: URL,
                imageURL: URL,
                elapsedTime: TimeInterval) {
        self.title = title
        self.articleURL = articleURL
        self.imageURL = imageURL
        self.elapsedTime = elapsedTime
    }
}
