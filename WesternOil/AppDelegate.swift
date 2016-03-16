//
//  AppDelegate.swift
//  WesternOil
//
//  Created by Brandon Wilkerson on 2/26/16.
//  Copyright © 2016 ApexIT. All rights reserved.
//

import UIKit
import CoreLocation




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    let locationManager = CLLocationManager()
    var enteredRegion = false
    
    
    let nest71Region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Nest71")


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: nil))

        
        
        
        
        Pushbots.sharedInstanceWithAppId("56be2b60177959f3628b4567");
        //Handle notification when the user click it, while app is closed.
        //This method will show an alert to the user.
        Pushbots.sharedInstance().receivedPush(launchOptions);
        return true
    }
    
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status{
            
        case .AuthorizedAlways:
            
            locationManager.startMonitoringForRegion(nest71Region)
            locationManager.startRangingBeaconsInRegion(nest71Region)
            locationManager.requestStateForRegion(nest71Region)
            
        case .Denied:
            
            let alert = UIAlertController(title: "Warning", message: "You've disabled location update which is required for this app to work. Go to your phone settings and change the permissions.", preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "OK!", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in }
            alert.addAction(alertAction)
            
            self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
            
        default:
            print("default case")
            
        }
        
        
    }
    

    
    func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
        
        
        switch state {
            
        case .Unknown:
            print("Unknown")
            
        case .Inside:
            //print("inside")
            
            var text: String = "Tap here to check out discounts for today!"
            
            if enteredRegion {
                text = "Walcome to PetroMart"
            }
            
            Notifications.display(text)
            
            
        case .Outside:
            //print("outside")
            
            var text : String = "Not buying anything?"
            
            if enteredRegion {
                text = "Wait!, check them out first"
                
            }
            
            
            Notifications.display(text)
            
            
            
            
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        enteredRegion = true
    }
    
    func locationManager(manager: CLLocationManager, didExitREgion region: CLRegion) {
        enteredRegion = false
    }
    
    
    
    
}
    
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        
        //Handle notification when the user click it while app is running in background or foreground.
     
        Pushbots.sharedInstance().receivedPush(userInfo)
        
        
    }
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0;
        //UIApplication.sharedApplication();
        
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0;
        //UIApplication.sharedApplication();
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // This method will be called everytime you open the app
        // Register the deviceToken on Pushbots
        Pushbots.sharedInstance().registerOnPushbots(deviceToken);
    }
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print ("Notification Registration Error.");
    }
    
    func receivedPush(userInfo: [NSObject: AnyObject]?) {
        
        var pushNotification: AnyObject?
        
        if let remoteNotificationPayload = userInfo?["aps"] as? NSDictionary {
            pushNotification = remoteNotificationPayload;
        }
        
        //Try to get Notification from [didReceiveRemoteNotification] dictionary
        if let remoteNotificationPayload = userInfo?[UIApplicationLaunchOptionsRemoteNotificationKey] as? NSDictionary {
            pushNotification = remoteNotificationPayload["aps"];
        }
        
        if pushNotification == nil {
            return;
        }
        
        let alert = pushNotification!.objectForKey("alert") as! String;
        
        //Show alert
        UIAlertView(title:"Notification!", message:alert, delegate:nil, cancelButtonTitle:"OK").show();
        
    }




