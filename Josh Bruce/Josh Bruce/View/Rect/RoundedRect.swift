//
//  RoundedRect.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

@IBDesignable class RoundedRect: UIView {

    // MARK: - Properties
    
    @IBInspectable var cornerRadius: Double = 4.0 {
        didSet {
            drawRoundedRect()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawRoundedRect()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        drawRoundedRect()
    }
    
    override func prepareForInterfaceBuilder() {
        drawRoundedRect()
    }
    
    // MARK: - Drawing
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        drawRoundedRect()
    }
    
    // MARK: - Methods
    
    func drawRoundedRect() {
        // Draw a rounded rect from the corner radius
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.masksToBounds = true
        clipsToBounds = true
    }

}