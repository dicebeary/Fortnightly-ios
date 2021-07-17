//
//  Article.swift
//  Domain
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Foundation

public struct Article {
    public var title: String
    public var articleURL: URL
    public var imageURL: URL?
    public var publishedDate: Date

    public init(title: String,
                articleURL: URL,
                imageURL: URL?,
                publishedDate: Date) {
        self.title = title
        self.articleURL = articleURL
        self.imageURL = imageURL
        self.publishedDate = publishedDate
    }
}
