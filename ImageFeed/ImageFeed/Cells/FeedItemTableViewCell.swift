//
//  FeedItemTableViewCell.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import UIKit

class FeedItemTableViewCell: UITableViewCell {

    /// Updates data to cell UI
    var feedItemViewModel: FeedItemViewModel? {
        didSet {
            feedItemTitleLabel.text = feedItemViewModel?.title
            feedItemDescriptionTextView.text = feedItemViewModel?.description

            if let feedItemViewModel = feedItemViewModel,
                let image = feedItemViewModel.image,
                let imgUrl = URL(string: image) {
                feedItemImage.loadImageWithUrl(imgUrl, failure: {
                    self.feedItemImage.image = UIImage.init(named: "placeholder")
                })
            } else {
                feedItemImage.image = UIImage.init(named: "placeholder")
            }
        }
    }

    /// Feed item label init
    private let feedItemTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        return lbl
    }()

    /// Feed item textView init
    private let feedItemDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()

    /// Feed item image init
    private let feedItemImage: ImageLoader = {
        let imgView = ImageLoader()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    /// Sets up cell UI
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none

        addSubview(feedItemTitleLabel)
        addSubview(feedItemDescriptionTextView)
        addSubview(feedItemImage)

        /// Image bottom constraint
        let feedItemImageBottomConstraint = feedItemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        feedItemImageBottomConstraint.priority = UILayoutPriority(rawValue: 250)

        /// Description lable bottom constraint
        let feedItemDescriptionLabelConstraint = feedItemDescriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0)
        feedItemDescriptionLabelConstraint.priority = UILayoutPriority(rawValue: 250)

        /// Description lable height constraint. Height will be 90 or greater than 90
        let feedItemDescriptionLabelHeightConstraint = NSLayoutConstraint(
                item: feedItemDescriptionTextView,
                attribute: .height,
                relatedBy: .greaterThanOrEqual,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: 90
        )
        feedItemDescriptionLabelHeightConstraint.priority = UILayoutPriority(rawValue: 1000)

        /// Sets constraint to title label, description textView and imageView
        NSLayoutConstraint.activate([
            feedItemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            feedItemImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            feedItemImage.widthAnchor.constraint(equalToConstant: 120.0),
            feedItemImage.heightAnchor.constraint(equalToConstant: 120.0),

            feedItemTitleLabel.topAnchor.constraint(equalTo: feedItemImage.topAnchor, constant: -10),
            feedItemTitleLabel.leadingAnchor.constraint(equalTo: feedItemImage.trailingAnchor, constant: 10),
            feedItemTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            feedItemTitleLabel.heightAnchor.constraint(equalToConstant: 40),

            feedItemDescriptionTextView.topAnchor.constraint(equalTo: feedItemTitleLabel.bottomAnchor, constant: -5),
            feedItemDescriptionTextView.leadingAnchor.constraint(equalTo: feedItemTitleLabel.leadingAnchor, constant: -5),
            feedItemDescriptionTextView.trailingAnchor.constraint(equalTo: feedItemTitleLabel.trailingAnchor),
            feedItemDescriptionLabelHeightConstraint,
            feedItemDescriptionLabelConstraint
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
