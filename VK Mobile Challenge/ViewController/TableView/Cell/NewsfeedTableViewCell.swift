//
//  NewsfeedTableViewCell.swift
//  VK Mobile Challenge
//
//  Created by Ilya Gluschuk on 10/11/2018.
//  Copyright © 2018 Ilya Glushchuk. All rights reserved.
//

import UIKit

final class NewsfeedTableViewCell: UITableViewCell {
    static let reuseIdentifier = "NewsfeedTableViewCell"

    var task: URLSessionDataTask?

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var repostLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var counterSeparator: UIView!

    @IBAction func tapShowMoreButton(_ sender: UIButton) {
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true

        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.layer.masksToBounds = true
    }

    func configure(with viewModel: NewsfeedViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        textView.text = viewModel.text

        viewsLabel.text = viewModel.viewsCount > 0 ? "\(viewModel.viewsCount)" : nil
        repostLabel.text = viewModel.repostCount > 0 ? "\(viewModel.repostCount)" : nil
        commentsLabel.text = viewModel.commentsCount > 0 ? "\(viewModel.commentsCount)" : nil
        likesLabel.text = viewModel.likeCounts > 0 ? "\(viewModel.likeCounts)" : nil

        task = profileImageView.setImage(with: viewModel.authorImageUrl)
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        task?.cancel()
        task = nil
        profileImageView.image = nil
    }
}
