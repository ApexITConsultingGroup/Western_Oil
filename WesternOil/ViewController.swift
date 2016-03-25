//
//  ViewController.swift
//  WesternOil
//
//  Created by Brandon Wilkerson on 2/26/16.
//  Copyright © 2016 ApexIT. All rights reserved.
//

import UIKit
import CoreLocation




class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var webView: UIWebView!
    
    
    
    var locationManager: CLLocationManager!
    
    
    
    
    

    
    @IBAction func backButton(sender: AnyObject) {
        webView.goBack()
    }
    
   
    
    
    @IBAction func doReload(sender: AnyObject) {
        webView.reload()
    }
    
    
    @IBAction func doCancel(sender: AnyObject) {
        
        webView.stopLoading()
    }
    
    @IBAction func doForward(sender: AnyObject) {
        webView.goForward()
    }

    
    @IBOutlet var forwardButton: UIButton!
    
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var refreshButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.apple.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            if CLLocationManager.isMonitoringAvailableForClass(CLBeacon.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                    
                }
            }
        }
    }
    
    func startScanning() {
        
        let uuid = NSUUID(UUIDString: "853BA712-6E3E-4DFC-864F-954AEA3BB7989")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, major: 123, minor: 456, identifier: "MyBeacon")
        
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
        
    }
    
    
    func locationManager(manager: CLLocationManager,
                         didRangeBeacons beacons: [CLBeacon],
                                         inRegion region: CLBeaconRegion) {
        
        if beacons.count > 0 {
            let beacon = beacons[0]
            updateDistance(beacon.proximity)
        } else {
            updateDistance(.Unknown)
        }
    }
    
    func updateDistance(distance: CLProximity) {
        
        _ = Notifications()
        
        
        
        UIView.animateWithDuration(0.8) {
            switch distance {
                
            case.Unknown:
                Notifications.display("display text")
                //self.view.backgroundColor = UIColor.grayColor()
                
            case.Far:
                Notifications.display("Are You Sure You Want to Leave?")
                //self.view.backgroundColor = UIColor.orangeColor()
                
            case.Near:
                Notifications.display("Check Out the Deals Today!")
                //self.view.backgroundColor = UIColor.blueColor()
                
            case.Immediate:
                Notifications.display("Check Out the Deals Today!")
                //self.view.backgroundColor = UIColor.redColor()
                
            }
        }
    }
    



    
    
    


}


