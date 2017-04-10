//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Vibin Nair on 07/04/17.
//  Copyright © 2017 VibinBigNerd. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    override func loadView() {
        self.mapView = MKMapView()
        self.view = mapView
    }
}
