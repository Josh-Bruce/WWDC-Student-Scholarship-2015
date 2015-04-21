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
    :param: animations      The animation block to be run
    :param: completion      The completion handler to be called once finished
*/
public func spring(duration: NSTimeInterval, delay: NSTimeInterval = 0.0, animations: (() -> ())!, completion: ((finished: Bool) -> ())?) {
    UIView.animateWithDuration(
		duration,
		delay: delay,
		usingSpringWithDamping: 0.7,
		initialSpringVelocity: 0.7,
		options: nil,
		animations: animations,
		completion: completion
	)
}

/**
    Convenience method for create a shake animation with CAKeyframeAnimation

    :param: duration    The duration that the animation should last
    :param: delay       The delay before the animation should start
    :param: force       The amount of force that should be applied to the animation

    :returns: The CAKeyframeAnimation to be placed on the views layer
*/
public func shake(duration: NSTimeInterval, delay: NSTimeInterval, force: Double) -> CAKeyframeAnimation {
    // Create a shake animation
    let animation = CAKeyframeAnimation()
    
    // Setup the properties for the animation
    animation.keyPath = "position.x"
    animation.values = [0, 30 * force, -30 * force, 30 * force, 0]
    animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.1 + Float(1.0 / 3), 1, 1)
    animation.duration = CFTimeInterval(duration)
    animation.additive = true
    animation.repeatCount = 1.0
    animation.beginTime = CACurrentMediaTime() + CFTimeInterval(delay)
    
    // Return animation
    return animation
}