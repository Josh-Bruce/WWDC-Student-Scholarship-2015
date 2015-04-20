//
//  Animations.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 20/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

/**
    Convenience method for spring animations with duration and completion blocks

    :param: duration        The duration that the animation should last
    :param: delay           The delay before the animation starts
    :param: animations      The animation block to be run
    :param: completion      The completion handler to be called once finished
*/
func spring(duration: NSTimeInterval, delay: NSTimeInterval = 0.0, animations: (() -> ())!, completion: ((finished: Bool) -> ())?) {
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveLinear, animations: animations, completion: completion)
}