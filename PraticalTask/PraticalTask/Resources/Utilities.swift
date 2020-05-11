//
//  Utilities.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    class func viewController(name: String, onStoryboard storyboardName: String) -> UIViewController
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: name) as UIViewController
    }
    
}
