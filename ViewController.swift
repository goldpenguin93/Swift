//
//  ViewController.swift
//  MIniBrowoser
//
//  Created by MAC on 2018. 5. 22..
//  Copyright © 2018년 MAC. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var bookMarkSegmentControl:
    UISegmentedControl!
    
    @IBOutlet var urlTextField: UIView!
    @IBOutlet weak var mainWebView: WKWebView!
    @IBOutlet weak var spinnigActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let initalURL = "http://www.facebook.com"
        let myURl = URL(string:initalURL)
        let myRequest = URLRequest(url:myURL!)
        mainWebView.load(myRequest)
    }
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func bookmarkaction(_ sender: Any) {
    }
    @IBOutlet weak var gobackaction: UIToolbar!
    @IBOutlet weak var gofowradaction: UIToolbar!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

