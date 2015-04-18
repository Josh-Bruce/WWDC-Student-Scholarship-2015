//
//  WelcomeViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeLabelCenterYConstraint: NSLayoutConstraint!

    // MARK: - Properties
    
    var welcomeLabelEndConstraints: [AnyObject]?
    
    var holder: [AnyObject]?
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        welcomeLabelCenterYConstraint.constant = view.frame.height
        view.layoutIfNeeded()
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.welcomeLabelCenterYConstraint.constant = 0
            self.welcomeLabel.alpha = 1
            self.view.layoutIfNeeded()
        }) { (success) -> Void in

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get end constraints for views
//        getEndConstraintsForViews()
//        
//        UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            self.view.addConstraints(self.holder!)
//            println("")
//        }) { (success) -> Void in
//            
//        }
    }
    
    // MARK: - Methods
    
    func getEndConstraintsForViews() {
        // Extract the ending constraints
        welcomeLabelEndConstraints = welcomeLabel.constraints()
        holder = view.constraints()
        view.removeConstraints(holder!)
    }
   
}