//
//  WWDCModelImporter.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import Foundation

/**
    Simple importer to get the array of data out from the plist
    file and into an array of data to be converted to models
*/
class WWDCModelImporter {
    
    // MARK: - Properties
    
    /// The filename to load the model data in from
    private var fileName: String!
    
    /// The array of items from the plist file
    var arrayOfItems = NSArray()
    
    // MARK: - Init
    
    init(fileName: String) {
        // Set class properties
        self.fileName = fileName
        
        // Parse the model items
        self.arrayOfItems = parseModel()
    }
    
    // MARK: - Private Methods
    
    /**
        Parse the model data from the plist file
    
        :returns: An NSArray of the items in the plist file
    */
    private func parseModel() -> NSArray {
        // Parse items from file
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist") {
            // Get an array from the file
            if let arrayOfItems = NSArray(contentsOfFile: path) {
                // Keep reference
                self.arrayOfItems = arrayOfItems
                
                // Return
                return self.arrayOfItems
            }
        }
        
        // Return nil
        return []
    }
    
}