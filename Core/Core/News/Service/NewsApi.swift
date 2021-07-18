//
//  NewsApi.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Moya

enum NewsApi {
    case topHeadlines(text: String?)
    case sources
}

extension NewsApi: TargetType {
    /// The target's base `URL`.
    var baseURL: URL { URL(string: "https://newsapi.org/v2")! }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .topHeadlines:
            return "/top-headlines"
        case .sources:
            return "/top-headlines/sources"
        }
    }

    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .topHeadlines:
            return .get
        case .sources:
            return .get
        }
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        switch self {
        case .topHeadlines:
            if let path = Bundle.main.path(forResource: "top-headlines", ofType: "json"),
                let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                return data
            }
        case .sources:
            return Data()
        }
        return Data()
    }

    /// The type of HTTP task to be performed.
    var task: Task {
        switch self {
        case .topHeadlines(let text):
            var params = ["country": "us"]
            if let text = text {
                params["q"] = text
            }
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        case .sources:
            return .requestPlain
        }
    }

    /// The headers to be used in the request.
    var headers: [String: String]? {
        return ["Authorization": "Bearer " + CoreConstants.apiKey]
    }
}
