//
//  ListVC.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ListVC: UIViewController {

    //MARK:- OUTLETS
     
    @IBOutlet weak var tblList: UITableView!
    
    //MARK:- VARIABLES
    
    var objResList : [Restaurants]?
    var current_page : Int?
    
    //MARK:- VIEW METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        tblList.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        self.tblList.separatorStyle = .none
        
        callGetAPI(page: "1")
    }

    //MARK: - VOID METHODS
    func callGetAPI(page : String) {
        Networking.getMethod(page, handler: {(response, error) in
            DispatchQueue.global(qos: .userInitiated).async {
                if response != nil {
                    do {
                        let objres = try JSONDecoder().decode(ResListModel.self, from : (response ?? nil)!)
                        if let resList = objres.restaurants?.count {
                            if resList > 0 {
                                self.current_page = objres.current_page
                                if let _val = objres.restaurants {
                                    if self.objResList?.count ?? 0 > 0 {
                                        for item in _val {
                                            self.objResList?.append(item)
                                        }
                                    }else{
                                        self.objResList = _val
                                    }
                                    DispatchQueue.main.async {
                                        self.tblList.reloadData()
                                    }
                                }
                            }
                        }
                    }catch let error{
                        print(error.localizedDescription)
                    }
                }
            }
        })
    }
}


//MARK:- EXTENSIONS
extension ListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.objResList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.item = self.objResList?[indexPath.row]
        cell.displayItems()
        
        return cell
    }
}

extension ListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath && indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
                self.callGetAPI(page: "\((self.current_page ?? 0) + 1)")
            }
        }
    }
    
}
