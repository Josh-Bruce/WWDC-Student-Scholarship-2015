//
//  Education.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class Education : WWDCCategory {
    
    // MARK: Init
    
    init(title: String, body: String, image: UIImage?, startDate: NSDate, endDate: NSDate?) {
        super.init(category: .Education, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
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
        
        // Call super init
        super.init(category: .Education, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
    }
    
}