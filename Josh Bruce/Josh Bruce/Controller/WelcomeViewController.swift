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
	
	@IBOutlet weak var joshBruceImageView: UIImageView!
	@IBOutlet weak var joshBruceImaveViewCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var letsBegin: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
	
		setupDefaults()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
		
		// Perform animations
        showWelcome { (finished) -> () in
			self.showProfilePicture { (finished) -> () in
				self.moveProfilePicture()
				self.showLetsBegin()
			}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Animation Methods
	
	func setupDefaults() {
		welcomeLabel.alpha = 0
		welcomeLabelCenterYConstraint.constant = view.frame.height
		joshBruceImageView.alpha = 0
		joshBruceImaveViewCenterYConstraint.constant = 0
		view.layoutIfNeeded()
	}
	
    func showWelcome(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 0.0, { () -> () in
            self.welcomeLabelCenterYConstraint.constant = 0
            self.welcomeLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion)
    }
	
	func showProfilePicture(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 1.0, { () -> () in
			self.welcomeLabel.alpha = 0.0
			self.joshBruceImageView.alpha = 1.0
		}, completion)
	}
	
	func moveProfilePicture(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 0.0, { () -> () in
			self.joshBruceImaveViewCenterYConstraint.constant = (self.view.frame.height / 2) - (self.joshBruceImageView.frame.height / 2) - 40
			self.view.layoutIfNeeded()
		}, completion)
	}
	
    func showLetsBegin(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 0.0, { () -> () in
            self.letsBegin.alpha = 1.0
        }, completion)
    }
    
    // MARK: - Actions
    
    @IBAction func letsBegin(sender: UIButton) {
        // Segue to menu
        performSegueWithIdentifier(Constant.Segues.showMenu, sender: self)
    }
   
}