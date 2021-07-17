//
//  ListViewMapper.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 17..
//

import Domain

struct ListViewMapper {
    static func map(from article: Article, index: Int) -> NewsCell.Data {
        
        return NewsCell.Data(title: NSAttributedString(string: article.title, attributes: Constants.titleAttributes),
                             elapsedTime: NSAttributedString(string: String(article.elapsedTime), attributes: Constants.titleAttributes),
                             image: article.imageURL,
                             isFirst: index == 0)
    }
}

// MARK: - Constants
private extension ListViewMapper {
    struct Constants {
        static let titleAttributes: [NSAttributedString.Key : Any]? = [:]
    }
}
