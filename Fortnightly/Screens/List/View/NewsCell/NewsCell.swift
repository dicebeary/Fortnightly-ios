//
//  NewsCell.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 17..
//

import UIKit
import Kingfisher

final class NewsCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var highlightImageView: UIImageView!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
}

// MARK: - Binding data
extension NewsCell: ViewDataBinder {
    struct Data {
        let title: NSAttributedString
        let elapsedTime: NSAttributedString
        let image: URL?
        let isFirst: Bool
    }

    func bind(data: Data) {
        titleLabel.attributedText = data.title
        elapsedTimeLabel.attributedText = data.elapsedTime

        thumbnailImageView.isHidden = data.isFirst
        thumbnailImageView.kf.setImage(with: data.image)

        highlightImageView.isHidden = !data.isFirst
        highlightImageView.kf.setImage(with: data.image)
    }
}
