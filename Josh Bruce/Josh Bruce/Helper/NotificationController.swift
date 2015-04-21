//
//  NotificationController.swift
//  Josh Bruce
//
//  Created by Josh Bruce on 21/04/2015.
//  Copyright (c) 2015 Josh Bruce. All rights reserved.
//

import UIKit

/**
    Convenience class for displaying notifications via Alerts or Action Sheets,
    this is a singleton that will handle anything alert related
*/
class NotificationController {
    
    // MARK: - Singleton
    
    class func sharedInstance() -> NotificationController {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: NotificationController? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = NotificationController()
        }
        return Static.instance!
    }
    
    // MARK: - Init
    
    private init() {
        
    }
    
    // MARK: - Methods
    
    /**
        Convenience method to display an alert given the title, message and actions
    
        :param: viewController  The view controller to display the alert from
        :param: title           The optional title for the alert
        :param: message         The optional message for the alert
        :param: actions         The array of UIAlertActions to be added to the alert
    */
    func displayAlert(viewController: UIViewController, title: String?, message: String?, actions: [UIAlertAction]) {
        // Create alert
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Add actions
        for action in actions {
            alertController.addAction(action)
        }
        
        // Present
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
}