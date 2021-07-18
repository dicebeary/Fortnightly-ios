//
//  CoreNewsAssembly.swift
//  Core
//
//  Created by Vajda Kristóf on 2021. 07. 17..
//

import Swinject
import Domain
import Moya

public final class CoreNewsAssembly: Assembly {
    public init() { /* no-op */ }

    public func assemble(container: Container) {
        registerInteractor(to: container)
        registerService(to: container)
    }
}

// MARK: - Interactor
private extension CoreNewsAssembly {
    func registerInteractor(to container: Container) {
        container.register(NewsInteractorInterface.self) { resolver in
            NewsInteractor(service: resolver.resolve(NewsServiceInterface.self)!)
        }
        .inObjectScope(.container)
    }
}

// MARK: - Service
private extension CoreNewsAssembly {
    func registerService(to container: Container) {
        container.register(NewsServiceInterface.self) { resolver in
            var provider: MoyaProvider<NewsApi>
            switch AppInfo.environment {
            case .mock:
                let stubClosure: MoyaProvider<NewsApi>.StubClosure = { _ in return StubBehavior.delayed(seconds: 1.0) }
                provider = MoyaProvider<NewsApi>(stubClosure: stubClosure,
                                                 plugins: [NetworkLoggerPlugin()])
            case .prod:
                provider = MoyaProvider<NewsApi>(plugins: [NetworkLoggerPlugin()])
            }
            return NewsService(provider: provider)
        }
        .inObjectScope(.graph)
    }
}
