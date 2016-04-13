//
//  WWDCModelFactory.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

/**
    A factory singleton class for parsing the results of the plist importer
    and then creating the model data into a readable usable array
*/
class WWDCModelFactory {
    
    // MARK: - Properties
    
    /// Private array of items that were passed into the parse method
    private var arrayOfItems: [AnyObject]!
    
    /// The model items that were parsed from the array of items
    var wwdcCategories: [WWDCCategoryProtocol]!
    
    // MARK: - Singleton
    
    class func sharedInstance() -> WWDCModelFactory {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: WWDCModelFactory? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = WWDCModelFactory()
        }
        return Static.instance!
    }
    
    // MARK: - Init

    private init() {
        // Init model array
        wwdcCategories = [WWDCCategoryProtocol]()
    }
    
    // MARK: - Methods
    
    /**
        Parse the model data from the [AnyObject] of items
        from the plist file
    
        - parameter arrayOfItems: The [AnyObject] from the the plist
    */
    func parseModel(arrayOfItems: [AnyObject]) {
        // Store properties
        self.arrayOfItems = arrayOfItems
        
        if let arrayOfDictionaries = arrayOfItems as? [[NSObject : AnyObject]] {
            // Iterate over items
            for model in arrayOfDictionaries {
                // Parse the category type
                if let categoryInt = model["category"] as? Int {
                    if let categoryType = WWDCCategoryType(rawValue: categoryInt) {
                        // Create a model item
                        let modelItem = createModelForType(categoryType, model: model)
                        
                        // Add to model array
                        wwdcCategories.append(modelItem)
                    }
                }
            }
        }
    }
    
    /**
        Get the items within a specific category type and return an array of them 
        that confirms to the WWDCCategoryProtocol to make this generic
    
        - parameter type:    The WWDCCategoryType you can the array to contain
    
        - returns: An array of of WWDCCategoryProtocol items for the type given
    */
    func itemsForCategory(type: WWDCCategoryType) -> [WWDCCategoryProtocol] {
        // Local array holder
        var itemsInCategory = [WWDCCategoryProtocol]()
        
        // Iterate over WWDC Categories Array
        for category in wwdcCategories {
            // Switch over types
            switch type {
            case .None:
                break
            case .Projects:
                // Check type
                if let wwdcCategory = category as? Project {
                    itemsInCategory.append(wwdcCategory)
                }
                break
            case .Education:
                // Check type
                if let wwdcCategory = category as? Education {
                    itemsInCategory.append(wwdcCategory)
                }
                break
            case .Work:
                // Check type
                if let wwdcCategory = category as? Work {
                    itemsInCategory.append(wwdcCategory)
                }
                break
            case .TechnicalSkills:
                // Check type
                if let wwdcCategory = category as? TechnicalSkill {
                    itemsInCategory.append(wwdcCategory)
                }
                break
            case .Interests:
                // Check type
                if let wwdcCategory = category as? Interest {
                    itemsInCategory.append(wwdcCategory)
                }
                break
            }
        }
        
        // Return
        return itemsInCategory
    }
    
    // MARK: - Private Methods
    
    /**
        Private method for creating the model classes from the [NSObject : AnyObject] of data
    
        - parameter type:    The WWDCCategoryType to create
        - parameter model:   The [NSObject : AnyObject] of model data to create the model
    */
    private func createModelForType(type: WWDCCategoryType, model: [NSObject : AnyObject]) -> WWDCCategoryProtocol {
        // Model Item
        var wwdcCategory: WWDCCategoryProtocol!
        
        // Switch over the types
        switch type {
        case .None:
            break
        case .Projects:
            let project = Project(dictionary: model)
            wwdcCategory = project
            break
        case .Education:
            let education = Education(dictionary: model)
            wwdcCategory = education
            break
        case .Work:
            let work = Work(dictionary: model)
            wwdcCategory = work
            break
        case .TechnicalSkills:
            let technicalSkill = TechnicalSkill(dictionary: model)
            wwdcCategory = technicalSkill
            break
        case .Interests:
            let interest = Interest(dictionary: model)
            wwdcCategory = interest
            break
        }
        
        // Return item
        return wwdcCategory
    }
    
}