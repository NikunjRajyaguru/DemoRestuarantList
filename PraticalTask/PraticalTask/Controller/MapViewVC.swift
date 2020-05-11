//
//  MapViewVC.swift
//  PraticalTask
//
//  Created by Apple on 11/05/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewVC: UIViewController {

    //MARK:- OUTLETS
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- VARIABLES
    var current_page = 1
    
    //MARK:- VIEW METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Chicago Location
        let noLocation = CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298)
        let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: 600, longitudinalMeters: 600)
        mapView.setRegion(viewRegion, animated: true)
        
        callGetAPI(page: "\(current_page)")
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
                                self.current_page = objres.current_page ?? 0
                                
                                if let _val = objres.restaurants {
                                    DispatchQueue.main.async {
                                        for item in _val {
                                        let annotation = MKPointAnnotation()
                                            annotation.title = item.name ?? ""
                                            annotation.subtitle = item.address ?? ""
                                            annotation.coordinate = CLLocationCoordinate2D(latitude: item.lat ?? 0, longitude: item.lng ?? 0)
                                            self.mapView.addAnnotation(annotation)
                                        }
                                        self.callGetAPI(page: "\(self.current_page + 1)")
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
