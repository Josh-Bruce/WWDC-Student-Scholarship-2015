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

    - None:             The default option for the superclass and should not be used
    - Projects:         The development projects that I have worked
    - Education:        My education background, what I study
    - Work:             My work background, people I have worked for and internships
    - TechnicalSkills:  The technical skills that I have, Swift :)
    - Interests:        Any additional interests that I have
*/
enum WWDCCategoryType : Int {
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
    
    var icon: UIImage? {
        get {
            switch self {
            case .None:
                return nil
            case .Projects:
                return UIImage(named: "projects-icon")
            case .Education:
                return UIImage(named: "education-icon")
            case .Work:
                return UIImage(named: "work-icon")
            case .TechnicalSkills:
                return UIImage(named: "swift-icon")
            case .Interests:
                return UIImage(named: "interests-icon")
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
    
    /// The image to be used as the icon instead of a color
    var image: UIImage? { get set }
    
    /// The start date of when this entry satrted
    var startDate: NSDate { get set }
    
    /// The end date which is 'optional' in a sense but will be set to today if not supplied
    var endDate: NSDate { get set }
    
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

/**
    WWDCCategory is the base class for all categories and 
    will implement most of the methods
*/
class WWDCCategory : NSObject, WWDCCategoryProtocol {
    
    // MARK: - Properties
    
    var category: WWDCCategoryType = .None
    
    var title: String = ""
    
    var body: String = ""
    
    var image: UIImage?
    
    var startDate: NSDate = NSDate()
    
    var endDate: NSDate = NSDate()
    
    var dateFormatter: NSDateFormatter!
    
    // MARK: - Init
    
    init(category: WWDCCategoryType, title: String, body: String, image: UIImage?, startDate: NSDate, endDate: NSDate) {
        super.init()
        
        // Init properties
        self.category = category
        self.title = title
        self.body = body
        self.image = image
        self.startDate = startDate
        self.endDate = endDate
        
        // Init the date formatter
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "YYYY"
    }
    
    // MARK: - WWDCCategoryProtocol
    
    func formattedStartDate() -> String {
        return dateFormatter.stringFromDate(startDate)
    }
    
    func formattedEndDate() -> String {
        if NSCalendar.currentCalendar().isDateInToday(endDate) {
            return "Current"
        }
        
        return dateFormatter.stringFromDate(endDate)
    }
    
}