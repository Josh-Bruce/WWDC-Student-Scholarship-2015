//
//  MenuTableViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 20/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController, CategoryCollectionViewControllerDelegate, UIDocumentInteractionControllerDelegate {
    
    // MARK: - Properties
    
    var categories = [WWDCCategoryType.Projects, WWDCCategoryType.Education, WWDCCategoryType.Work, WWDCCategoryType.TechnicalSkills, WWDCCategoryType.Interests]
    
    var selectedType: WWDCCategoryType = .None
    
    var documentController: UIDocumentInteractionController!
    
    // MARK: - Lifecyle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        // Hide the back button
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    // MARK: - Methods
    
    func showCVWithQuickLook() {
        // Get the URL to be shown
        if let urlString = NSBundle.mainBundle().pathForResource(Constant.File.CV, ofType: "pdf") {
            if let url = NSURL(fileURLWithPath: urlString) {
                // Init the document controller
                documentController = UIDocumentInteractionController(URL: url)
                documentController.delegate = self
                documentController.presentPreviewAnimated(true)
                documentController.name = "Josh's CV"
            }
        }
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        } else {
            return categories.count + 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Cell holder
        var cell: UITableViewCell!

        if indexPath.section == 0 {
            // Deque cell
            var categoryCell = tableView.dequeueReusableCellWithIdentifier("aboutCell", forIndexPath: indexPath) as! AboutTableViewCell

            // Asign back the cell
            cell = categoryCell
        } else {
            // Deque cell
            var categoryCell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! CategoryTableViewCell
            
            // Extra cell thats not a category but same style
            if indexPath.row == categories.count {
                // Configure the cell...
                categoryCell.categoryTitleLabel.text = "Timeline"
                categoryCell.categoryColor = Constant.Colors.DarkBlueColor
                categoryCell.iconImageView.image = UIImage(named: "timeline-icon-large")
            } else {
                // Get the type
                let type = categories[indexPath.row]
                
                // Configure the cell...
                categoryCell.categoryTitleLabel.text = type.title
                categoryCell.categoryColor = type.color
                categoryCell.iconImageView.image = type.icon
            }
            
            // Set custom disclosure icon
            if let image = UIImage(named: "disclosure-icon") {
                categoryCell.accessoryView = UIImageView(image: image)
            }
            
            // Asign back the cell
            cell = categoryCell
        }

        return cell
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Switch over section & row
        switch (indexPath.section, indexPath.row) {
        case (0, _):
            showCVWithQuickLook()
        case (1, 0..<categories.count):
            // Get the object
            let object = categories[indexPath.row]
            
            // Set selected
            selectedType = object
            
            // Segue to category type
            performSegueWithIdentifier(Constant.Segues.ShowCategoryType, sender: self)
        case (1, categories.count):
            // Segue to timeline
            performSegueWithIdentifier(Constant.Segues.ShowTimeline, sender: self)
        default:
            break
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Return height for the row and section
        if indexPath.section == 0 {
            return 120.0
        }
        
        // Default cell height
        return 100.0
    }
    
    // MARK: - UIDocumentInteractionControllerDelegate
    
    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    // MARK: - CategoryCollectionViewControllerDelegate
    
    func didSelectTimeline() {
        // Segue to the timeline
        performSegueWithIdentifier(Constant.Segues.ShowTimeline, sender: self)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // IndexPath holder
        var indexPath: NSIndexPath!
        
        // Get the indexPath
        if let cellIndexPath = tableView.indexPathForSelectedRow() {
            indexPath = cellIndexPath
        }
        
        // Prepare for segue
        if segue.identifier == Constant.Segues.ShowCategoryType {
            if let dvc = segue.destinationViewController as? CategoryCollectionViewController {
                dvc.categoryType = selectedType
                dvc.delegate = self
            }
        }
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}