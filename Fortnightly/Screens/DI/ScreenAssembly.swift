//
//  ScreenAssembly.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 17..
//

import Swinject
import SwinjectStoryboard
import Domain

public final class ScreenAssembly: Assembly {
    public init() { /* no-op */ }

    public func assemble(container: Container) {
        registerNavigator(to: container)
        registerList(to: container)
        registerDetails(to: container)
    }
}

// MARK: - Navigator
private extension ScreenAssembly {
    func registerNavigator(to container: Container) {
        container.register(NavigatorInterface.self) { resolver in
            Navigator()
        }
    }
}

// MARK: - List
private extension ScreenAssembly {
    func registerList(to container: Container) {
        container.register(ListViewModel.self) { resolver in
            ListViewModel(newsInteractor: resolver.resolve(NewsInteractorInterface.self)!,
                          navigator: resolver.resolve(NavigatorInterface.self)!)
        }

        container.storyboardInitCompleted(ListViewController.self) { resolver, screen in
            screen.viewModel = resolver.resolve(ListViewModel.self)!
        }
    }
}

// MARK: - Details
private extension ScreenAssembly {
    func registerDetails(to container: Container) {
        container.register(DetailsViewModel.self) { resolver in
            DetailsViewModel(newsInteractor: resolver.resolve(NewsInteractorInterface.self)!)
        }

        container.storyboardInitCompleted(DetailsViewController.self) { resolver, screen in
            screen.viewModel = resolver.resolve(DetailsViewModel.self)!
            screen.hidesBottomBarWhenPushed = true
        }
    }
}
