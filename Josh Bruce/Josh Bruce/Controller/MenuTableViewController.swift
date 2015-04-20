//
//  MenuTableViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 20/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var categories = [WWDCCategoryType.Projects, WWDCCategoryType.Education, WWDCCategoryType.Work, WWDCCategoryType.TechnicalSkills, WWDCCategoryType.Interests]
    
    var selectedType: WWDCCategoryType = .None

    // MARK: - Lifecyle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Automatic cell dimensions
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                categoryCell.backgroundColor = Constant.Colors.DarkBlueColor
                categoryCell.iconImageView.image = UIImage(named: "timeline-icon")
            } else {
                // Get the type
                let type = categories[indexPath.row]
                
                // Configure the cell...
                categoryCell.categoryTitleLabel.text = type.title
                categoryCell.backgroundColor = type.color
                categoryCell.iconImageView.image = type.icon
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
            }
        }
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}