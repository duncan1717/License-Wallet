//
//  UrlController.swift
//  HuntingLicense
//
//  Created by Duncan Stanton on 3/27/18.
//  Copyright © 2018 Charlie Stanton. All rights reserved.
//

import UIKit

class UrlController: UIViewController {
    let controller = storyboard.instantiateViewControllerWithIdentifier("UrlControllerID")
    var urlString: String?
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlString = self.urlString, let url = URL(string: urlString){
            self.webView.loadRequest(URLRequest(url: url))
        }
    }//end viewDidLoad

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }//end didRecieveMemoryWarning
}//end UrlController
