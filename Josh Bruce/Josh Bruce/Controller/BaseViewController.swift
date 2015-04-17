//
//  BaseViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Status Bar
    
    // Ensure all view controllers that inherit from base have .LightContent style bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}