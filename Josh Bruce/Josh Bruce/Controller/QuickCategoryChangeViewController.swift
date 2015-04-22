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
    func didSelectTimeline()
}

class QuickCategoryChangeViewController: BaseViewController {

    // MARK: - Outlets 
    
    @IBOutlet var projectsButton: CircleButton!
    @IBOutlet var educationButton: CircleButton!
    @IBOutlet var workButton: CircleButton!
    @IBOutlet var technicalSkillsButton: CircleButton!
    @IBOutlet var interestsButton: CircleButton!
    @IBOutlet var timelineButton: CircleButton!
    
    @IBOutlet var buttons: [CircleButton]!
    
    // MARK: - Properties
    
    var delegate: QuickCategoryChangeViewControllerDelegate?
    
    var animator: UIDynamicAnimator!
    var gravityBehaviour: UIGravityBehavior!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initiate the Dynamic Animator
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    // MARK: - Methods
    
    func selectCategoryType(category: WWDCCategoryType) {
        // Pass back to delegate
        delegate?.didSelectCategory(category)
        
        // Dismiss
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addGravityToAllButtons() {
        // Add gravity to all button
        var gravity = UIGravityBehavior(items: buttons)
        gravity.gravityDirection = CGVectorMake(0, 10)
        // Add behavior
        animator.addBehavior(gravity)
    }
   
    // MARK: - Actions
    
    @IBAction func cancel(sender: UIButton) {
        // Add gravity to all button
        addGravityToAllButtons()
        
        // Dismiss without changing
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func showCategoryForSender(sender: CircleButton) {
        // Hold category type
        var categoryType: WWDCCategoryType = .None
        
        // Switch the button type
        switch sender {
        case projectsButton:
            categoryType = .Projects
        case educationButton:
            categoryType = .Education
        case workButton:
            categoryType = .Work
        case technicalSkillsButton:
            categoryType = .TechnicalSkills
        case interestsButton:
            categoryType = .Interests
        default:
            categoryType = .None
        }
        
        // Call the delegate method
        selectCategoryType(categoryType)
    }
    
    @IBAction func showTimeline(sender: CircleButton) {
        // Dismiss
        dismissViewControllerAnimated(true) {
            // Pass back delegate
            self.delegate?.didSelectTimeline()
        }
    }
    
}