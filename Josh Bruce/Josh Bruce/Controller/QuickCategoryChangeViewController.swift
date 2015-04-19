//
//  QuickCategoryChangeViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 19/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

protocol QuickCategoryChangeViewControllerDelegate {
    func didSelectCategory(category: WWDCCategoryType)
}

class QuickCategoryChangeViewController: BaseViewController {

    // MARK: - Properties
    
    var delegate: QuickCategoryChangeViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("test"), userInfo: nil, repeats: false)
    }
    
    func test() {
        selectCategoryType(.Projects)
    }
    
    // MARK: - Methods
    
    func selectCategoryType(category: WWDCCategoryType) {
        // Pass back to delegate
        delegate?.didSelectCategory(category)
        
        // Dismiss
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    // MARK: - Actions
    
}