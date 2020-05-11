//
//  Extensions.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
import SQLite3

var db : OpaquePointer?

extension UIViewController {
    
    func createDatabase() -> Bool{
        
        let fileurl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Restaurants.sqlite")
        
        if sqlite3_open(fileurl.path, &db) != SQLITE_OK {
            print("Error in opening database")
            return false
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Restaurants (id INTEGER PRIMARY KEY AUTOINCREMENT,resid TEXT, name TEXT, address TEXT, contact TEXT, image TEXT, lat TEXT, lng TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error creating Restaurant table")
            return false
        }
        return true
    }
    
    func insertItems(item : Restaurants) -> Bool{
        
        var stmt : OpaquePointer?
        
        let insertQuery = "INSERT INTO Restaurants (resid, name, address, contact, image, lat, lng) VALUES (?,?,?,?,?,?,?)"
        
        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
            print("Error in binding query")
        }
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_bind_text(stmt, 1, "\(item.id ?? 0)", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding resid")
        }
        if sqlite3_bind_text(stmt, 2, "\(item.name ?? "")", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding name")
        }
        
        if sqlite3_bind_text(stmt, 3, "\(item.address ?? "")", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding address")
        }
        if sqlite3_bind_text(stmt, 4, "\(item.phone ?? "")", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding contact")
        }
        
        if sqlite3_bind_text(stmt, 5, "\(item.image_url ?? "")", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding image")
        }
        if sqlite3_bind_text(stmt, 6, "\(item.lat ?? 0)", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding lat")
        }
        
        if sqlite3_bind_text(stmt, 7, "\(item.lng ?? 0)", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            print("Error binding lng")
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Record insterted successfully")
            return true
        }
        return false
    }
    
    
//    func fetchrecords() -> [Restaurants]{
//        
//        var list = [Restaurants]()
//        //this is our select query
//        let queryString = "SELECT * FROM Restaurants"
//        
//        //statement pointer
//        var stmt:OpaquePointer?
//        
//        //preparing the query
//        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
//            let errmsg = String(cString: sqlite3_errmsg(db)!)
//            print("error preparing insert: \(errmsg)")
//            return []
//        }
//        
//        //traversing through all the records
//        while(sqlite3_step(stmt) == SQLITE_ROW){
//            let id = sqlite3_column_int(stmt, 0)
//            let resid = String(cString: sqlite3_column_text(stmt, 1))
//            let name = String(cString: sqlite3_column_text(stmt, 2))
//            let address = String(cString: sqlite3_column_text(stmt, 3))
//
//            //adding values to list
//            list.append(Restaurants(from: <#T##Decoder#>))
//        }
//        
//        return list
//    }
    
    func deleteRecord() -> Bool{
        
        let deleteQuery = "DELETE FROM Restaurants;"
        
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteQuery, -1, &deleteStatement, nil) == SQLITE_OK {
            
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
                return false
            }
        } else {
            print("DELETE statement could not be prepared")
            return false
        }
        sqlite3_finalize(deleteStatement)
        return true
    }
    
}


