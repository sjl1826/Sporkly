//
//  MenuCell.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 11/12/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var backgroundBox: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    var item: MenuCellPresentable? {
        didSet {
            iconImageView.isHidden = (item?.icon == nil)
            iconImageView.image = item?.icon
            backgroundBox.backgroundColor = item?.backgroundColor
            nameLabel.textColor = item?.titleColor ?? .black
            nameLabel.text = item?.title
            nameLabel.numberOfLines = 2
            detailLabel.text = item?.detail
            detailLabel.textColor = item?.detailColor ?? .black
            leftLabel.text = item?.left
            leftLabel.textColor = UIColor.gray
            rightLabel.text = item?.right
            rightLabel.textColor = UIColor.gray
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundBox.clipsToBounds = true
        backgroundBox.layer.cornerRadius = 5
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        backgroundBox.backgroundColor = .white
        nameLabel.text = nil
        leftLabel.text = nil
        rightLabel.text = nil
    }
}
