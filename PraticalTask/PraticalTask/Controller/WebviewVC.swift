//
//  WebviewVC.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import WebKit

class WebviewVC: UIViewController {

    //MARK:- OUTLETS
      
    @IBOutlet weak var webView: WKWebView!
    
    //MARK:- VARIABLES
    var _url = ""
    
    //MARK:- VIEW METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: _url) {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func btnDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
