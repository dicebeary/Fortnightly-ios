//
//  NewsServiceInterface.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import RxSwift

// sourcery: AutoMockable
protocol NewsServiceInterface {
    func getNewsList(text: String?) -> Single<NewsApiModel>
}
