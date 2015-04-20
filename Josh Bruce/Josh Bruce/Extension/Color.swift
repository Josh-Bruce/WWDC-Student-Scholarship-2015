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
        
        :param: percent     Percentage to lighten the color by
    
        :returns: A lighter UIColor by the percentage amount
    */
    func lighterColor(percent: Double) -> UIColor {
        return colorWithBrightnessFactor(CGFloat(1 + percent));
    }
    
    /**
        Returns a darker color by the provided percentage
        
        :param: percent     Percentage to darken the color by
    
        :returns: A darker UIColor by the percentage amount
    */
    func darkerColor(percent: Double) -> UIColor {
        return colorWithBrightnessFactor(CGFloat(1 - percent));
    }
    
    /**
        Return a modified color using the brightness factor provided
        
        :param: factor      The factor to adjust the brightness by
    
        :returns: The modified UIColor by the factor
    */
    func colorWithBrightnessFactor(factor: CGFloat) -> UIColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
        } else {
            return self;
        }
    }
    
}