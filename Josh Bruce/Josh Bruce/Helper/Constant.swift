//
//  Constant.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 16/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

/**
    A struct to hold all Constants for the application allowing for easy change and overview
    or such colors and any other properties used throughout
*/
struct Constant {
    
    /**
        Colors struct which holds the core colors used within the application
    */
    struct Colors {
        
        /**
            Pink Color
        */
        static let PinkColor = UIColor(red: 223.0/255.0, green: 62.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        
        /**
            Orange Color
        */
        static let OrangeColor = UIColor(red: 233.0/255.0, green: 128.0/255.0, blue: 112.0/255.0, alpha: 1.0)
        
        /**
            Yellow Color
        */
        static let YellowColor = UIColor(red: 243.0/255.0, green: 191.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        
        /**
            Blue Color
        */
        static let BlueColor = UIColor(red: 62.0/255.0, green: 68.0/255.0, blue: 197.0/255.0, alpha: 1.0)
        
        /**
            Green Color
        */
        static let GreenColor = UIColor(red: 111.0/255.0, green: 220.0/255.0, blue: 172.0/255.0, alpha: 1.0)
        
        /**
            Dark Blue Color
        */
        static let DarkBlueColor = UIColor(red: 51.0/255.0, green: 62.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        
        /**
            Light Blue Color
        */
        static let LightBlueColor = UIColor(red: 94.0/255.0, green: 194.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        
        /**
            Red Highlight Color
        */
        static let RedColor = UIColor(red: 208.0/255, green: 8.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        
        /**
            Shadow Color
        */
        static let ShadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
        
    }
    
    /**
        Segue struct to hold all the segue strings used within the storyboard
    */
    struct Segues {
        
        /**
            Segue to show the main menu
        */
        static let ShowMenu = "showMenu"
        
        /**
            Segue to show the timeline
        */
        static let ShowTimeline = "showTimeline"
        
        /**
            Segue to show the category type
        */
        static let ShowCategoryType = "showCategoryType"
        
        /**
            Segue to show the category item details
        */
        static let ShowCategoryItemDetail = "showCategoryItemDetail"
        
        /**
            Segue to show the quick category selection
        */
        static let ShowCategoryQuickSelection = "showQuickCategorySelection"
        
    }
    
    /**
        Static filenames that are used through the application
    */
    struct File {
        
        /**
            The filename of my CV (Resume)
        */
        static let CV = "JoshBruce"
        
    }
    
}