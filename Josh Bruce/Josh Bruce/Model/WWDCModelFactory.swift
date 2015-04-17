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
    
    // MARK: Properties
    
    /// Private array of items that were passed into the parse method
    private var arrayOfItems: NSArray!
    
    /// The model items that were parsed from the array of items
    var wwdcCategories: [WWDCCategoryProtocol]!
    
    // MARK: Singleton
    
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
    
    // MARK: Init

    private init() {
        // Init model array
        wwdcCategories = [WWDCCategoryProtocol]()
    }
    
    // MARK: Methods
    
    /**
        Parse the model data from the NSArray of items
        from the plist file
    
        :param: arrayOfItems The NSArray from the the plist
    */
    func parseModel(arrayOfItems: NSArray) {
        // Store properties
        self.arrayOfItems = arrayOfItems
        
        if let arrayOfDictionaries = arrayOfItems as? [NSDictionary] {
            // Iterate over items
            for model in arrayOfDictionaries {
                // Parse the category type
                if let categoryInt = model.valueForKey("category") as? Int {
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
        Private method for creating the model classes from the NSDictionary of data
    
        :param: type    The WWDCCategoryType to create
        :param: model   The NSDictionary of model data to create the model
    */
    private func createModelForType(type: WWDCCategoryType, model: NSDictionary) -> WWDCCategoryProtocol {
        // Model Item
        var wwdcCategory: WWDCCategoryProtocol!
        
        // Parse properties
        let title = model.valueForKey("title") as? String ?? "No title specified"
        let body = model.valueForKey("body") as? String ?? "No body specified"
        let imageName = model.valueForKey("imageName") as? String
        let image = imageName != nil ? UIImage(named: imageName!) : nil
        let startDate = model.valueForKey("startDate") as? NSDate ?? NSDate()
        let endDate = model.valueForKey("endDate") as? NSDate
        
        // Switch over the types
        switch type {
        case .None:
            break
        case .Projects:
            let project = Project(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
            wwdcCategory = project
            break
        case .Education:
            let education = Education(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
            wwdcCategory = education
            break
        case .Work:
            let work = Work(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
            wwdcCategory = work
            break
        case .TechnicalSkills:
            let technicalSkill = TechnicalSkill(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
            wwdcCategory = technicalSkill
            break
        case .Interests:
            let interest = Interest(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
            wwdcCategory = interest
            break
        }
        
        // Return item
        return wwdcCategory
    }
    
}