//
//  NewsInteractorInterface.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import RxSwift

// sourcery: AutoMockable
public protocol NewsInteractorInterface {
    var news: Observable<[Article]> { get }
    var selectedArticle: Observable<Article> { get }

    func fetchNews(text: String?) -> Completable
    func fetchSources() -> Completable
    func selectArticle(_ item: Article) -> Completable
}
