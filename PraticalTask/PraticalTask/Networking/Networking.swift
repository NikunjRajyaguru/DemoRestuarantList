//
//  Networking.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


class Networking: NSObject {
    
    typealias completionHandler = (_ success : Data?, _ error : Any?) -> ()
    
    static private let session = URLSession.shared
    
    static func getMethod(_ page : String, handler: @escaping  completionHandler)  {
        
        let geturl = "http://opentable.herokuapp.com/api/restaurants?city=chicago&per_page=50&page=\(page)"
        
        guard let url = URL(string: geturl) else {
            return
        }
        
        Networking.session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let data = data {
                    handler(data, nil)
                }
            }else{
                handler(nil, error)
            }
        }.resume()
    }
}


