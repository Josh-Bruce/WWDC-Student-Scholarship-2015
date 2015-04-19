//
//  CategoryCollectionViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

let reuseIdentifier = "categoryCell"

class CategoryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, QuickCategoryChangeViewControllerDelegate {

    // MARK: - Properties
    
    var categoryType: WWDCCategoryType! = .Projects
    
    var collection = [WWDCCategoryProtocol]()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
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
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        // View
        var reusableView: UICollectionReusableView!
        
        // Check for header
        if kind == UICollectionElementKindSectionHeader {
            // Deque a header
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "categoryHeader", forIndexPath: indexPath) as! CategoryHeaderCollectionReusableView
            
            // Set properties
            headerView.titleLabel.text = categoryType.title
            
            // Set back on view
            reusableView = headerView
        }
        
        if kind  == UICollectionElementKindSectionFooter {
            // Deque a header
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "categoryFooter", forIndexPath: indexPath) as! UICollectionReusableView
            
            // Set back on view
            reusableView = footerView
        }
        
        // Return
        return reusableView
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
        performSegueWithIdentifier(Constant.Segues.ShowCategoryItemDetail, sender: self)
    }
    
    // MARK: - QuickCategoryChangeViewControllerDelegate
    
    func didSelectCategory(category: WWDCCategoryType) {
        // Change the category on the fly
        categoryType = category
        
        // Get data
        collection = WWDCModelFactory.sharedInstance().itemsForCategory(categoryType)
        
        // Reload the collection view with animation
        collectionView?.performBatchUpdates({ () -> Void in
            self.collectionView?.reloadSections(NSIndexSet(index: 0))
        }, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Hold the object
        var object: WWDCCategoryProtocol!
        
        // Get the indexPath
        if let indexPath = collectionView?.indexPathsForSelectedItems().first as? NSIndexPath {
            // Get the object
            object = collection[indexPath.row]
        }
        
        // Check segue and destination
        if segue.identifier == Constant.Segues.ShowCategoryItemDetail {
            if let dvc = segue.destinationViewController as? ItemViewController {
                dvc.item = object
            }
        } else if segue.identifier == Constant.Segues.ShowCategoryQuickSelection {
            if let dvc = segue.destinationViewController as? QuickCategoryChangeViewController {
                dvc.delegate = self
            }
        }

    }
    
    // MARK: - Actions

    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func handlerLongPressGesture(sender: UILongPressGestureRecognizer) {
        if sender.state == .Began {
            performSegueWithIdentifier(Constant.Segues.ShowCategoryQuickSelection, sender: self)
        }
    }
    
    // MARK: - Status Bar
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
