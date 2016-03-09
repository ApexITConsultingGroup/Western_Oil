//
//  ViewController.swift
//  WesternOil
//
//  Created by Brandon Wilkerson on 2/26/16.
//  Copyright © 2016 ApexIT. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.apple.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

