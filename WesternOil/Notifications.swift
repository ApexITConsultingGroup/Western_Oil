//
//  Notifications.swift
//  WesternOil
//
//  Created by Brandon Wilkerson on 3/16/16.
//  Copyright © 2016 ApexIT. All rights reserved.
//

import Foundation
import UIKit

class Notifications {
    
    class func display(text: String) {
        
        let notification: UILocalNotification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        
        let dateTime = NSDate()
        notification.fireDate = dateTime
        notification.alertBody = text
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        
        
        
    }
    
    
}
