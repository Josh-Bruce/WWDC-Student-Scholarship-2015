//
//  TimelineTableViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    // MARK: Lifecycle
    
    let colors = [Constant.Colors.PinkColor, Constant.Colors.OrangeColor, Constant.Colors.BlueColor, Constant.Colors.GreenColor, Constant.Colors.YellowColor]
    let texts = [
        "Unlock application iPhone 6+ $299 pixels Pages. Retina personality beautiful iMac iPhone did 5mm. Change Apple Watch 3X faster best retina SSD pixels. Design performance brilliant $249 hi-def SSD iBooks AMD. Upshot Smart Cover HealthKit $399 change. Design personality teraflops most change Finder cellular milestone. Hi-res Apple Store milestone iCal Finder iCloud Apple iPad 1080p. Selfie translucent Downloads $799 Finder Tim SSD.",
        "iPhone translucent one touch love selfie camera. Bigger Smart Cover. Selfie personality Apple Pay $699 iPhone Metal call. Hi-def fingerprint Downloads $399 hi-def bigger. iCloud touchscreen milestone love unlock Apple. Hi-res new A8 chip until now ever upshot hi-res. Finder touchscreen instantly call iTunes A8X AMD Pages iCloud. Hi-def Apple Watch beautiful best camera focus 8X faster. Hi-res fingerprint one touch most design. Unlock translucent milestone iPad iTunes unlock Metal Apple Watch battery life slo-mo.",
        "Hi-def new A8 chip Cupertino $499 iTunes AMD iBooks updated. Retina translucent HealthKit best selfie Apple teraflops. Change power users Spotlight iMac slo-mo. Screen 6000+ songs iPad Mini $599 camera design. Pixels thunderbolt pinch-out iMac. Design touchscreen dark mode flat screen Metal 3X faster. Retina personality Mavericks iPad Finder Tim SSD flat contrast. Selfie new A8 chip Downloads $599 iBooks. Bigger Smart Cover milestone Siri design touch Apple Watch new features Finder.",
        "Screen Smart Cover until now love screen change milestone instant. Hi-res new A8 chip teraflops Jony bigger Apple Downloads AirPlay. Better Apple Watch Mavericks flat screen. iPhone application iPad Mini $399. Pixels personality 8X faster $699 better A8X screen Air 5mm variety. iCloud translucent App Store love. Hi-def remote lock App Store love camera pixel 6000+ songs in the world. Hi-res translucent one touch flat iCloud iBooks 3X faster impossible. iTunes performance Apple Pay flat iBooks. Upshot Smart Cover iPad Mini thin. iCloud Apple Watch milestone iCal design Tim Air focus. Finder touchscreen 3X faster iPad iCloud Finder Steve. Design translucent milestone thin change 1080p. iCloud 6000+ songs Apple Pay zoom Finder Craig $249."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        // Uncomment the following line to preserve selection between presentations
        clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timelineItemCell", forIndexPath: indexPath) as! TimelineTableViewCell

        // Configure the cell...
        let index = Int(arc4random_uniform(UInt32(colors.count)))
        let descIndex = Int(arc4random_uniform(UInt32(texts.count)))

        cell.iconView.backgroundColor = colors[index]
        cell.descriptionLabel.text = texts[descIndex]
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}