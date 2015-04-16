//
//  WWDCCategory.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

/**
    ENUM for the categories that are required to be mentioned withing
    the scholarship application

    - Projects:         The development projects that I have worked
    - Education:        My education background, what I study
    - Work:             My work background, people I have worked for and internships
    - TechnicalSkills:  The technical skills that I have, Swift :)
    - Interests:        Any additional interests that I have
*/
enum WWDCCategoryType {
    case None, Projects, Education, Work, TechnicalSkills, Interests
    
    /// The color to be used for the WWDCCategory
    var color: UIColor {
        get {
            switch self {
            case .None:
                return Constant.Colors.LightBlueColor
            case .Projects:
                return Constant.Colors.PinkColor
            case .Education:
                return Constant.Colors.OrangeColor
            case .Work:
                return Constant.Colors.GreenColor
            case .TechnicalSkills:
                return Constant.Colors.YellowColor
            case .Interests:
                return Constant.Colors.BlueColor
            }
        }
    }
}

/**
    All categories models must implement this protocol for grouping
    within arrays for the timeline for abstraction
*/
protocol WWDCCategoryProtocol {
    
    /// The WWDCCategory that this model is
    var category: WWDCCategoryType { get set }
    
    /// The title of the entry
    var title: String { get set }
    
    /// The description of the entry
    var body: String { get set }
    
    /// The start date of when this entry satrted
    var startDate: NSDate { get set }
    
    /// The end date which is optional of when this entry finished
    var endDate: NSDate? { get set }
    
    /**
        Will produce a formatted string of the start date
    
        :returns: The formatted start date as a string
    */
    func formattedStartDate() -> String
    
    /**
        Will produce a formatted string of the end date
    
        :returns: The formatted end date as a string if it exists or 
        it will return the string 'current'
    */
    func formattedEndDate() -> String
    
}

/// WWDCCategory is the base class for all categories and will implement most methods
class WWDCCategory : NSObject, WWDCCategoryProtocol {
    
    // MARK: Properties
    
    var category: WWDCCategoryType = .None
    
    var title: String = ""
    
    var body: String = ""
    
    var startDate: NSDate = NSDate()
    
    var endDate: NSDate?
    
    var dateFormatter: NSDateFormatter!
    
    // MARK: Init
    
    init(category: WWDCCategoryType, title: String, body: String, startDate: NSDate, endDate: NSDate?) {
        super.init()
        
        // Init properties
        self.category = category
        self.title = title
        self.body = body
        self.startDate = startDate
        self.endDate = endDate
        
        // Init the date formatter
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "YYYY"
    }
    
    // MARK: WWDCCategoryProtocol
    
    func formattedStartDate() -> String {
        return dateFormatter.stringFromDate(startDate)
    }
    
    func formattedEndDate() -> String {
        if let endDate = self.endDate {
            return dateFormatter.stringFromDate(endDate)
        }
        
        return "Current"
    }
    
}