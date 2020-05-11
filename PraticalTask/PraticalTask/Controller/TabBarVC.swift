//
//  TabBarVC.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    //MARK: - VOID METHODS
    
    
    //MARK:- VIEW METHODS
    
    override func viewDidLayoutSubviews()
    {
        self.tabBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK:- EXTENSIONS
