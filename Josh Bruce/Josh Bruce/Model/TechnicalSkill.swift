//
//  TechnicalSkill.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class TechnicalSkill : WWDCCategory {
    
    // MARK: Properties
    
    var skillPercentage: Double = 0.0
    
    // MARK: Init
    
    init(title: String, body: String, image: UIImage?, startDate: NSDate, endDate: NSDate?) {
        super.init(category: .TechnicalSkills, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
        // Set any class specific properties
    }
    
    init(dictionary: NSDictionary) {
        // Parse items from dictionary
        let title = dictionary["title"] as? String ?? "No title specified"
        let body = dictionary["body"] as? String ?? "No body specified"
        let imageName = dictionary["imageName"] as? String
        let image = imageName != nil ? UIImage(named: imageName!) : nil
        let startDate = dictionary["startDate"] as? NSDate ?? NSDate()
        let endDate = dictionary["endDate"] as? NSDate
        let skillPercentage = dictionary["skillPercentage"] as? Double ?? 0.0
        
        // Call super init
        super.init(category: .TechnicalSkills, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
        // Set class specific properties
        self.skillPercentage = skillPercentage
    }
    
}