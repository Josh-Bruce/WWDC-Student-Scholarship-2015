//
//  CategoryTableViewCell.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 20/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    // MARK: - Properties
    
    var categoryColor: UIColor! {
        didSet {
            backgroundColor = categoryColor
        }
    }
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            backgroundColor = categoryColor.darken(0.1)
        } else {
            backgroundColor = categoryColor
        }
    }

}