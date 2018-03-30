//
//  BrowserController.swift
//  HuntingLicense
//
//  Created by Duncan Stanton on 3/28/18.
//  Copyright © 2018 Charlie Stanton. All rights reserved.
//

import UIKit

class BrowserController: UIViewController {

    var text:String?
    
    @IBOutlet weak var webBrowser: UIWebView!
    
    @IBOutlet weak var stateUrlLabel: UILabel!
    
    
    override func viewDidLoad() {
        if let receivedText = text {
            stateUrlLabel.text = text
           // return stateUrlLabel
        }
    }

   

    

}
