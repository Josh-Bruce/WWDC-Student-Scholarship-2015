//
//  TimelineTableViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    // MARK: - Properties
    
    var timeline = [WWDCCategoryProtocol]()

    // MARK: - Lifecycle

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Show the navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Automatic cell dimensions
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        // Uncomment the following line to preserve selection between presentations
        clearsSelectionOnViewWillAppear = true
        
        // Get data
        timeline = WWDCModelFactory.sharedInstance().wwdcCategories
        // Sort by date order (latest ending at the top)
        timeline.sort { $0.startDate.compare($1.startDate) == NSComparisonResult.OrderedDescending }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return timeline.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timelineItemCell", forIndexPath: indexPath) as! TimelineTableViewCell

        // Configure the cell...
        let object = timeline[indexPath.row]
        
        cell.iconView.backgroundColor = object.category.color
        cell.titleLabel.text = object.title
        cell.descriptionLabel.text = object.body
        cell.iconImage = object.image
        
        let startDate = object.formattedStartDate("YYYY")
        let endDate = object.formattedEndDate("YYYY")
        cell.dateLabel.text = "\(startDate) - \(endDate)"
        
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}