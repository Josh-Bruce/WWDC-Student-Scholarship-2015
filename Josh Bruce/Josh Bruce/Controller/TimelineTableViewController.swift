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

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        // Uncomment the following line to preserve selection between presentations
        clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Import data
        timeline = WWDCModelFactory.sharedInstance().wwdcCategories
        // Sort by date order (latest ending at the top)
        timeline.sort { $0.endDate.compare($1.endDate) == NSComparisonResult.OrderedDescending }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

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
        cell.dateLabel.text = "\(object.formattedStartDate()) - \(object.formattedEndDate())"
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}