//
//  Color.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
        Returns a lighter color by the provided percentage
        
        - parameter percent:     Percentage to lighten the color by
    
        - returns: A lighter UIColor by the percentage amount
    */
    func lighten(percent: Double) -> UIColor {
        return colorWithBrightness(CGFloat(1 + percent));
    }
    
    /**
        Returns a darker color by the provided percentage
        
        - parameter percent:     Percentage to darken the color by
    
        - returns: A darker UIColor by the percentage amount
    */
    func darken(percent: Double) -> UIColor {
        return colorWithBrightness(CGFloat(1 - percent));
    }
    
    /**
        Return a modified color using the brightness factor provided
        
        - parameter factor:      The factor to adjust the brightness by
    
        - returns: The modified UIColor by the factor
    */
    func colorWithBrightness(factor: CGFloat) -> UIColor {
        // Starting values
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract the components that make up the color in the HSB color space
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            // Return new UIColor
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
        } else {
            // Couldn't extract so just return original color
            return self;
        }
    }
    
}