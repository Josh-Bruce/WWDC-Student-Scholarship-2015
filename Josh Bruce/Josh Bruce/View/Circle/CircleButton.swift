//
//  CircleButton.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

@IBDesignable class CircleButton: UIButton {
    
    // MARK: - Properties
    
    @IBInspectable var categoryColor: UIColor! {
        didSet {
            backgroundColor = categoryColor
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = categoryColor.darkerColor(0.1)
            } else {
                backgroundColor = categoryColor
            }
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawCircle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Drawing

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        drawCircle()
    }
    
    // MARK: - Methods
    
    func drawCircle() {
        // Draw a circle based upon width / 2
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }
    
}
