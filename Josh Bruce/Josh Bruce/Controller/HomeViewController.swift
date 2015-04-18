//
//  HomeViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 18/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var projectsButton: CircleButton!
    @IBOutlet var educationButton: CircleButton!
    @IBOutlet var workButton: CircleButton!
    @IBOutlet var technicalSkillsButton: CircleButton!
    @IBOutlet var interestsButton: CircleButton!
    
    // MARK: - Properties
    
    var categoryType: WWDCCategoryType = .None
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func showCategoryForSender(sender: CircleButton) {
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
        
        // Segue to the category collection view
        performSegueWithIdentifier(Constant.Segues.ShowCategoryType, sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Check segue type
        if segue.identifier == Constant.Segues.ShowCategoryType {
            if let dvc = segue.destinationViewController as? CategoryCollectionViewController {
                dvc.categoryType = categoryType
            }
        }
    }
   
}