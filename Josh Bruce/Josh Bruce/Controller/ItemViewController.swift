//
//  ItemViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class ItemViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var itemContainerView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var titles: [String]!
    var item: WWDCCategoryProtocol! {
        didSet {
            createDataSource()
        }
    }
    
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var gravityBehaviour: UIGravityBehavior!
    var snapBehavior: UISnapBehavior!
    
    let dateFormatter = NSDateFormatter()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        updateInterfaceForItem()
        
        animator = UIDynamicAnimator(referenceView: view)
        dateFormatter.dateFormat = "MM YYYY"
    }
    
    // MARK: - Methods
    
    func createDataSource() {
        // Init arrays
        titles = [String]()
        
        // Extract required information
        titles.append("Title")
        titles.append("Date")
        titles.append("Description")
        
        // Optional extra row for Projects
        if let item = item as? Project {
            if let languages = item.languages {
                titles.append("Skills")
            }
        }
    }
    
    func updateInterfaceForItem() {
        // Udate the UI given the item
        colorView.backgroundColor = item.category.color
        logoImageView.image = item.image
        
        // Check type
        if let work = item as? Work {
            logoImageView.image = work.logoImage
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
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let item = item as? Project {
            return item.languages?.count ?? 0
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell! //tableView.dequeueReusableCellWithIdentifier("timelineItemCell", forIndexPath: indexPath) as! TimelineTableViewCell
        
        // Switch over section
        switch indexPath.section {
        case 0:
            // Dequeue
            cell = tableView.dequeueReusableCellWithIdentifier("itemTitleCell", forIndexPath: indexPath) as! UITableViewCell
            
            // Set title
            cell.textLabel?.text = item.title
        case 1:
            // Dequeue
            cell = tableView.dequeueReusableCellWithIdentifier("itemDateCell", forIndexPath: indexPath) as! UITableViewCell

            // Set date range
            let dateRange = "\(dateFormatter.stringFromDate(item.startDate))"
        case 2:
             cell = UITableViewCell()
        case 3:
             cell = UITableViewCell()
        default:
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
}