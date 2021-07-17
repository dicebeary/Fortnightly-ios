//
//  ListViewController.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import UIKit
import Domain
import RxDataSources
import RxSwift
import RxCocoa

final class ListViewController: UIViewController {
    // MARK: - ViewModel
    var viewModel: ListViewModel!

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupBindings()
    }
}

// MARK: - Binding data
extension ListViewController: ViewDataBinder {
    struct Data {
        var items: Driver<[NewsCell.Data]>
    }

    func bind(data: Data) {
        data.items
            .drive(tableView.rx.items(cellIdentifier: NewsCell.reuseIdentifier, cellType: NewsCell.self)) { index, element, cell in
                cell.bind(data: element)
            }.disposed(by: bag)
    }
}

// MARK: - Providing events
extension ListViewController: ViewEventListener {
    struct Events {

    }

    var events: Events {
        return Events()
    }
}

// MARK: - Setup
private extension ListViewController {
    func setupBindings() {
        let input = ListViewModel.Input(screenEvents: self.events)
        let output = viewModel.map(from: input)
        bind(data: output.screenData)
    }

    func setupTableView() {
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.tableFooterView = UIView()
        tableView.register(NewsCell.self)
    }

    func setupNavigationBar() {
        self.tabBarController?.title = "Front page"
        self.tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationController?.navigationBar.large = true
    }
}
