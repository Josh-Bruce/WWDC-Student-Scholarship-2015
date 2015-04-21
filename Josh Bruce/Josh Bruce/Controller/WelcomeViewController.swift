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
    @IBOutlet weak var joshBruceLabel: UILabel!
    @IBOutlet weak var joshBruceLabelVerticalSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var enjoyReviewingLabel: UILabel!
    @IBOutlet weak var enjoyReviewingLabelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var letsBegin: UIButton!
    
    // MARK: - Properties
    
    var letsBeginTimer: NSTimer?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
	
        // Setup the default values before animations occur
		setupDefaults()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
		
		// Perform animations
        showWelcome { (finished) -> () in
			self.showProfilePicture { (finished) -> () in
                self.moveProfilePicture { (finished) -> () in
                    self.showName { (finished) -> () in
                        self.showEnjoyReviewing { (finished) -> () in
                            self.showLetsBegin { (finished) -> () in
                                // If not been clicked within 5 seconds should shake view
                                self.letsBeginTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("shouldShakeLetsBegin"), userInfo: nil, repeats: true)
                            }
                        }
                    }
                }
			}
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Remove timer
        letsBeginTimer?.invalidate()
        letsBeginTimer = nil
    }
    
    // MARK: - Animation Methods
	
	func setupDefaults() {
        // Reset defaults for all views
		welcomeLabel.alpha = 0.0
		welcomeLabelCenterYConstraint.constant = view.frame.height
        
		joshBruceImageView.alpha = 0.0
		joshBruceImaveViewCenterYConstraint.constant = 0.0
        joshBruceImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
        
        joshBruceLabel.alpha = 0.0
        joshBruceLabelVerticalSpaceConstraint.constant = 8.0
        
        enjoyReviewingLabel.alpha = 0.0
        enjoyReviewingLabelCenterYConstraint.constant = enjoyReviewingLabel.frame.height * 2
        
        letsBegin.alpha = 0.0
        
        // layout for constraint changes
		view.layoutIfNeeded()
	}
	
    func showWelcome(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 1.0, { () -> () in
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
			self.joshBruceImaveViewCenterYConstraint.constant = (self.view.frame.height / 2) - ((self.joshBruceImageView.frame.height / 2) * 0.75) - 40
            self.joshBruceImageView.transform = CGAffineTransformMakeScale(0.75, 0.75)
			self.view.layoutIfNeeded()
		}, completion)
	}
    
    func showName(completion: ((finished: Bool) -> ())? = nil) {
        spring(0.5, delay: 0.0, { () -> () in
            self.joshBruceLabelVerticalSpaceConstraint.constant = -16.0
            self.joshBruceLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion)
    }
    
    func showEnjoyReviewing(completion: ((finished: Bool) -> ())? = nil) {
        spring(1.0, delay: 0.5, { () -> () in
            self.enjoyReviewingLabel.alpha = 1.0
            self.enjoyReviewingLabelCenterYConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion)
    }
	
    func showLetsBegin(completion: ((finished: Bool) -> ())? = nil) {
		spring(1.0, delay: 0.0, { () -> () in
            self.letsBegin.alpha = 1.0
        }, completion)
    }
    
    func shakeLetsBegin() {
        // Variables
        let duration = 1.0
        let delay = 0.0
        let force = 0.5

        // Add shake to view
        letsBegin.layer.addAnimation(shake(duration, delay, force), forKey: "shake")
    }
    
    // MARK: - Methods
    
    func shouldShakeLetsBegin() {
        // Call method to animate view (bounce / pulsate)
        shakeLetsBegin()
    }
    
    // MARK: - Actions
    
    @IBAction func letsBegin(sender: UIButton) {
        // Segue to menu
        performSegueWithIdentifier(Constant.Segues.showMenu, sender: self)
    }
   
}