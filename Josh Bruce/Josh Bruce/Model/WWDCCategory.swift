//
//  WWDCCategory.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import Foundation

/**
    ENUM for the categories that are required to be mentioned withing
    the scholarship application

    - Projects:         The development projects that I have worked
    - Education:        My education background, what I study
    - Work:             My work background, people I have worked for and internships
    - TechnicalSkills:  The technical skills that I have, Swift :)
    - Interests:        Any additional interests that I have
*/
enum WWDCCategory {
    case Projects, Education, Work, TechnicalSkills, Interests
}

/**
    All categories models must implement this protocol for grouping
    within arrays for the timeline for abstraction
*/
protocol WWDCCategoryProtocol {
    
    /// The WWDCCategory that this model is
    var category: WWDCCategory { get }
    
    /// The title of the entry
    var title: String { get }
    
    /// The description of the entry
    var description: String { get }
    
    /// The start date of when this entry satrted
    var startDate: NSDate { get }
    
    /// The end date which is optional of when this entry finished
    var endDate: NSDate? { get }
    
}