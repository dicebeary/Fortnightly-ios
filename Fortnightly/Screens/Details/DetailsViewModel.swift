//
//  DetailsViewModel.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 17..
//

import Domain
import RxSwift
import RxCocoa

final class DetailsViewModel {
    private let newsInteractor: NewsInteractorInterface
    private let bag = DisposeBag()

    init(newsInteractor: NewsInteractorInterface) {
        self.newsInteractor = newsInteractor
    }
}

// MARK: - Transform data flow
extension DetailsViewModel: ViewModelManipulator {
    func navigate(from viewController: UIViewController) {}

    struct Input {}

    struct Output {
        let screenData: DetailsViewController.Data
    }

    func map(from input: Input) -> Output {
        let screenData = getScreenData()
        return Output(screenData: screenData)
    }
}

// MARK: - Event handling
private extension DetailsViewModel {
}

// MARK: - Output helper methods
private extension DetailsViewModel {
    func getScreenData() -> DetailsViewController.Data {
        let imageUrl = newsInteractor.selectedArticle
            .map(\.imageURL)
            .asDriver(onErrorJustReturn: nil)
        
        let category = newsInteractor.selectedArticle
            .map(\.category)
            .map { $0?.uppercased() }
            .asDriver(onErrorJustReturn: nil)

        let language = newsInteractor.selectedArticle
            .map(\.language)
            .map { $0?.uppercased() }
            .asDriver(onErrorJustReturn: nil)

        let title = newsInteractor.selectedArticle
            .map(\.title)
            .asDriver(onErrorJustReturn: "")

        let content = newsInteractor.selectedArticle
            .map(\.content)
            .asDriver(onErrorJustReturn: "")
        return DetailsViewController.Data(imageUrl: imageUrl, language: language, category: category, title: title, content: content)
    }
}
