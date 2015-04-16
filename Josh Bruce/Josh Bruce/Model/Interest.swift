//
//  Interest.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import Foundation

class Interest : WWDCCategory {
    
    // MARK: Init
    
    init(title: String, body: String, startDate: NSDate, endDate: NSDate?) {
        super.init(category: .Interests, title: title, body: body, startDate: startDate, endDate: endDate)
        
        // Set any clas specific properties
    }
    
}