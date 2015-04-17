//
//  ItemViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class ItemViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var item: WWDCCategoryProtocol! {
        didSet {
            updateInterfaceForItem()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        updateInterfaceForItem()
    }
    
    // MARK: - Methods
    
    func updateInterfaceForItem() {
        // Udate the UI given the item
        //colorView.backgroundColor = item.category.color
    }
   
}