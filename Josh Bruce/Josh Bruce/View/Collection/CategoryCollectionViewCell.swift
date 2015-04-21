//
//  CategoryCollectionViewCell.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

@IBDesignable class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var iconImageView: RoundedImage!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var iconImage: UIImage? {
        didSet {
            if iconImage != nil {
                iconImageView.image = iconImage
            }
        }
    }
    
    var categoryColor: UIColor! {
        didSet {
            backgroundColor = categoryColor
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = categoryColor.darken(0.1)
            } else {
                backgroundColor = categoryColor
            }
        }
    }
    
    @IBInspectable var cornerRadius: Double = 4.0
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        drawRoundedRect()
    }
    
    // MARK: - IBDesignable
    
    override func prepareForInterfaceBuilder() {
        drawRoundedRect()
    }
    
    // MARK: - Methods
    
    func drawRoundedRect() {
        layer.cornerRadius = CGFloat(cornerRadius)
        clipsToBounds = true
        layer.masksToBounds = true
    }
    
}