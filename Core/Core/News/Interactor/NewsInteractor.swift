//
//  NewsInteractor.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Domain
import RxSwift
import RxCocoa

// sourcery: AutoMockable
class NewsInteractor: NewsInteractorInterface {
    private let newsRelay = PublishRelay<[Article]>()
    var news: Observable<[Article]> {
        newsRelay.asObservable()
    }

    private let service: NewsServiceInterface

    init(service: NewsServiceInterface) {
        self.service = service
    }

    func fetchNews(text: String?) -> Completable {
        return service.getNewsList()
            .map(\.articles)
            .map { try $0.map { try NewsInteractor.map($0) } }
            .do(onSuccess: { [weak self] news in
                self?.newsRelay.accept(news)
            })
            .asCompletable()
    }
}

// MARK: - Mappers
private extension NewsInteractor {
    static func map(_ apiModel: NewsArticleApiModel) throws -> Article {
        guard let url = URL(string: apiModel.url) else { throw NewsError.parseError(propertyName: "url") }
        let imageUrl = URL(string: apiModel.urlToImage ?? "")
        let publishedDate = map(apiModel.publishedAt)
        return Article(title: apiModel.title,
                       articleURL: url,
                       imageURL: imageUrl,
                       elapsedTime: publishedDate?.timeIntervalSince(Date()) ?? 0)
    }

    static func map(_ iso8601String: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        return dateFormatter.date(from: iso8601String)
    }
}
