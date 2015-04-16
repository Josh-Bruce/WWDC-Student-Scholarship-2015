//
//  Project.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class Project : WWDCCategory {
    
    // MARK: Init

    init(title: String, body: String, image: UIImage?, startDate: NSDate, endDate: NSDate?) {
        super.init(category: .Projects, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
        // Set any clas specific properties
    }
    
}