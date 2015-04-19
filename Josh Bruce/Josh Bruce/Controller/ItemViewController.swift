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
    
    @IBOutlet weak var itemContainerView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var skillsLabel: UILabel!
    
    @IBOutlet weak var descriptionLabelBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var item: WWDCCategoryProtocol!
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var snapBehavior: UISnapBehavior!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        // Update our UI to reflect the item selected
        updateInterfaceForItem()
        
        // Initiate the Dynamic Animator
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    // MARK: - Methods
    
    func updateInterfaceForItem() {
        // Udate the UI given the item
        colorView.backgroundColor = item.category.color
        logoImageView.image = item.image
        
        // Item details
        titleLabel.text = item.title
        descriptionLabel.text = item.body
        
        let dateFormat = "MMM YYYY"
        let startDate = item.formattedStartDate(dateFormat)
        let endDate = item.formattedEndDate(dateFormat)
        dateLabel.text = "\(startDate) - \(endDate)"
        
        // Check type
        if let work = item as? Work {
            logoImageView.image = work.logoImage ?? work.image
        }
        
        if let project = item as? Project {
            if let skills = project.languages {
                skillsLabel.text = ", ".join(skills)
            }
        } else {
            // Expand view
            bottomContainer.removeConstraints(bottomContainer.constraints())
            descriptionLabelBottomConstraint.constant = 8
        }
    }
    
    // MARK: - Actions
    
    @IBAction func handlePanGesture(sender: UIPanGestureRecognizer) {
        // Setup view and locations
        let viewToMove = itemContainerView
        let location = sender.locationInView(view)
        let itemLocation = sender.locationInView(viewToMove)
        
        // Check the gesture state
        if sender.state == .Began {
            // Remove existing behavior
            animator.removeBehavior(snapBehavior)
            
            // Create the center offset
            let centerOffset = UIOffsetMake(itemLocation.x - CGRectGetMidX(viewToMove.bounds), itemLocation.y - CGRectGetMidY(viewToMove.bounds))
            attachmentBehavior = UIAttachmentBehavior(item: viewToMove, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            
            // Add behavior
            animator.addBehavior(attachmentBehavior)
        } else if sender.state == .Changed {
            // Set teh anchor point
            attachmentBehavior.anchorPoint = location
        } else if sender.state == .Ended {
            // Remove behavior
            animator.removeBehavior(attachmentBehavior)
            
            // Create new snap behavior
            snapBehavior = UISnapBehavior(item: viewToMove, snapToPoint: view.center)
            // Add it
            animator.addBehavior(snapBehavior)
            
            // Check if we have moved 100 points down
            let translation = sender.translationInView(view)
            if translation.y > 100 {
                // Remove all behaviors
                animator.removeAllBehaviors()
                
                // Add gravity to take the view down
                var gravity = UIGravityBehavior(items: [viewToMove])
                gravity.gravityDirection = CGVectorMake(0, 10)
                // Add behavior
                animator.addBehavior(gravity)
                
                // Dismiss
                dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
}