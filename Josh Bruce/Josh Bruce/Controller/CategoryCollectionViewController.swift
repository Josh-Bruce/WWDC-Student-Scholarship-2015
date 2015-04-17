//
//  CategoryCollectionViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

let reuseIdentifier = "categoryCell"

class CategoryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // MARK: - Properties
    
    var categoryType: WWDCCategoryType! = .Projects
    
    var collection = [WWDCCategoryProtocol]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Get data
        collection = WWDCModelFactory.sharedInstance().itemsForCategory(categoryType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // Return the number of sections
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of items in the section
        return collection.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Configure the cell class
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        // Configure the cell
        cell.backgroundColor = categoryType.color
        
        // Get the object
        let object = collection[indexPath.row]
        
        // Set properties on the cell
        cell.iconImage = object.image ?? categoryType.icon
        cell.titleLabel.text = object.title
    
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Calculate the width of the device
        let width = collectionView.bounds.width
        let height = CGFloat(100.0)
        let leftPadding = 10.0
        let rightPadding = 10.0
        // Calculate the width for a two column layout
        let cellWidth = (width / 2) - CGFloat(leftPadding + (rightPadding / 2))
        
        // Return the cell size
        return CGSizeMake(cellWidth, height)
    }

    // MARK: - UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showCategoryDetail", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    // MARK: - Status Bar
    
    // Ensure all view controllers that inherit from base have .LightContent style bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
