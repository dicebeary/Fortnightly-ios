//
//  ListViewModel.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import Domain

protocol ListViewModelInterface {}

class ListViewModel {
    private let newsInteractor: NewsInteractorInterface

    init(newsInteractor: NewsInteractorInterface) {
        self.newsInteractor = newsInteractor
    }
}

extension ListViewModel: ViewModelProtocol {
    struct Input {

    }

    struct Output {

    }

    func map(from input: Input) -> Output {
        return Output()
    }
}
