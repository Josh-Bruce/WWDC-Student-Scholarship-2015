//
//  TimelineTableViewCell.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var timelineUpper: RoundedRect!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: RoundedImage!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timelineLower: UIView!
    
    // MARK: - Properties
    
    var iconImage: UIImage? {
        didSet {
            if iconImage != nil {
                iconImageView.image = iconImage
                iconImageView.hidden = false
                iconView.hidden = true
            } else {
                iconImageView.hidden = true
                iconView.hidden = false
            }
        }
    }
    
    // MARK: - Init

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}