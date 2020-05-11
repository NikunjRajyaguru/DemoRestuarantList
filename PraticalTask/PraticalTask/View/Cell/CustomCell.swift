//
//  CustomCell.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {

    //MARK:- OUTLETS
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var imgRes: UIImageView!
    
    //@IBOutlet weak var btnReserve: UIButton!
    
    //MARK:- VARIABLES
    var item : Restaurants?
    
    //MARK:- VIEW METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - VOID METHODS

    func displayItems() {
        self.lblName.text = item?.name
        self.lblAddress.text = item?.address
        self.lblContact.text = item?.phone
        
        if let url = URL(string: item?.image_url ?? "") {
            imgRes.kf.indicatorType = .activity
            imgRes.kf.setImage(with: url)
        }
    }
    
    @IBAction func btnReservedClicked(_ sender: UIButton) {
        
        let vc = Utilities.viewController(name: "WebviewVC", onStoryboard: "Main") as! WebviewVC
        vc.modalPresentationStyle = .fullScreen
        vc._url = "https://www.opentable.com/r/rosebud-steakhouse-chicago?rid=\(item?.id ?? 0)"
        self.window?.rootViewController?.present(vc, animated: true, completion: nil)
        
        
    }
    
}
