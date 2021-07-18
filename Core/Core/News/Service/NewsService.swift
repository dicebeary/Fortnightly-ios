//
//  NewsService.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Foundation
import RxSwift
import Moya

class NewsService: NewsServiceInterface {

    var provider: MoyaProvider<NewsApi>

    init(provider: MoyaProvider<NewsApi>) {
        self.provider = provider
    }

    func getNewsList(text: String?) -> Single<NewsApiModel> {
        return provider.rx.request(.topHeadlines(text: text))
            .activateLoadingIndicator()
            .filterSuccessfulStatusCodes()
            .parseError()
            .map(NewsApiModel.self)
    }

    func getSources() -> Single<SourcesApiModel> {
        return provider.rx.request(.sources)
            .activateLoadingIndicator()
            .filterSuccessfulStatusCodes()
            .parseError()
            .map(SourcesApiModel.self)
    }
}
