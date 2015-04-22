//
//  CategoryCollectionViewController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 17/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

let reuseIdentifier = "categoryCell"

protocol CategoryCollectionViewControllerDelegate {
    func didSelectTimeline()
}

class CategoryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, QuickCategoryChangeViewControllerDelegate {

    // MARK: - Properties
    
    var delegate: CategoryCollectionViewControllerDelegate?
    
    var collection = [WWDCCategoryProtocol]()

    var categoryType: WWDCCategoryType! = .Projects {
        didSet {
            // Set title
            title = categoryType.title
            
            // Get data
            collection = WWDCModelFactory.sharedInstance().itemsForCategory(categoryType)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        // Get the object
        let object = collection[indexPath.row]
        
        // Set properties on the cell
        cell.categoryColor = categoryType.color
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
        performSegueWithIdentifier(Constant.Segues.ShowCategoryItemDetail, sender: self)
    }
    
    // MARK: - QuickCategoryChangeViewControllerDelegate
    
    func didSelectCategory(category: WWDCCategoryType) {
        // Change the category on the fly
        categoryType = category
        
        // Reload the collection view with animation
        collectionView?.performBatchUpdates({ () -> Void in
            self.collectionView?.reloadSections(NSIndexSet(index: 0))
        }, completion: nil)
    }
    
    func didSelectTimeline() {
        // Pop view controller
        navigationController?.popViewControllerAnimated(true)
        
        // Call delegate for showing timeline
        delegate?.didSelectTimeline()
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
