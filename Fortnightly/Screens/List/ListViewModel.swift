//
//  ListViewModel.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Domain
import RxSwift
import RxCocoa

final class ListViewModel {
    private let newsInteractor: NewsInteractorInterface
    private let bag = DisposeBag()

    init(newsInteractor: NewsInteractorInterface) {
        self.newsInteractor = newsInteractor
    }
}

// MARK: - Transform data flow
extension ListViewModel {
    struct Input {
        let screenEvents: ListViewController.Events
    }

    struct Output {
        let screenData: ListViewController.Data
    }

    func map(from input: Input) -> Output {
        fetchInitialData()

        return Output(screenData: ListViewController.Data(items: getItems()))
    }
}

// MARK: - Event handling
private extension ListViewModel {
    func fetchInitialData() {
        newsInteractor.fetchNews(text: nil)
            .subscribe()
            .disposed(by: bag)
    }
}

// MARK: - Output helper methods
private extension ListViewModel {
    func getItems() -> Driver<[NewsCell.Data]> {
        newsInteractor.news
            .map { $0.enumerated().map { ListViewMapper.map(from: $0.element, index: $0.offset) } }
            .asDriver(onErrorJustReturn: [])
    }
}
