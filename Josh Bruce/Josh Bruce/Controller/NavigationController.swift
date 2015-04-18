//
//  NavigationController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 18/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    // MARK: - Status Bar
    
    // Ensure all view controllers that inherit from base have .LightContent style bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
   
}