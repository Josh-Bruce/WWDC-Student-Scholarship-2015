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

    // MARK: - Outlets 
    
    @IBOutlet var projectsButton: CircleButton!
    @IBOutlet var educationButton: CircleButton!
    @IBOutlet var workButton: CircleButton!
    @IBOutlet var technicalSkillsButton: CircleButton!
    @IBOutlet var interestsButton: CircleButton!
    @IBOutlet var timelineButton: CircleButton!
    
    // MARK: - Properties
    
    var delegate: QuickCategoryChangeViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    func selectCategoryType(category: WWDCCategoryType) {
        // Pass back to delegate
        delegate?.didSelectCategory(category)
        
        // Dismiss
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    // MARK: - Actions
    
    @IBAction func cancel(sender: UIButton) {
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
        
    }
    
}