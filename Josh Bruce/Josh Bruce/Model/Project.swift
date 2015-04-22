//
//  Project.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

class Project : WWDCCategory {
    
    // MARK: - Properties
    
    /// Optional URL to a resource to highlight more information
    var url: NSURL?
    
    /// Optional [String] of programming languages used within the project
    var languages: [String]?
    
    // MARK: - Init

    init(title: String, body: String, image: UIImage?, startDate: NSDate, endDate: NSDate) {
        super.init(category: .Projects, title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
        // Set any class specific properties
    }
    
    convenience init(dictionary: [NSObject : AnyObject]) {
        // Parse items from dictionary
        let title = dictionary["title"] as? String ?? "No title specified"
        let body = dictionary["body"] as? String ?? "No body specified"
        let imageName = dictionary["imageName"] as? String
        let image = imageName != nil ? UIImage(named: imageName!) : nil
        let startDate = dictionary["startDate"] as? NSDate ?? NSDate()
        let endDate = dictionary["endDate"] as? NSDate ?? NSDate()

        // Call designated init
        self.init(title: title, body: body, image: image, startDate: startDate, endDate: endDate)
        
        // Set class specific properties
        if let urlString = dictionary["urlString"] as? String {
            if let url = NSURL(string: urlString) {
                self.url = url
            }
        }
        
        if let languages = dictionary["languages"] as? [String] {
            self.languages = languages
        }
    }
    
}