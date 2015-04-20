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
    
    @IBOutlet weak var letsBegin: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        welcomeLabelCenterYConstraint.constant = view.frame.height
        view.layoutIfNeeded()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        showWelcome { (finished) -> () in
            self.showLetsBegin()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Animation Methods
    
    func showWelcome(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, { () -> () in
            self.welcomeLabelCenterYConstraint.constant = 0
            self.welcomeLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion)
    }
    
    func showLetsBegin(completion: ((finished: Bool) -> ())? = nil) {
        spring(1.0, { () -> () in
            self.letsBegin.alpha = 1.0
        }, completion)
    }
    
    // MARK: - Actions
    
    @IBAction func letsBegin(sender: UIButton) {
        // Segue to menu
        performSegueWithIdentifier(Constant.Segues.showMenu, sender: self)
    }
   
}