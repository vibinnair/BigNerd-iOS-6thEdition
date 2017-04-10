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
    
        // Create segmented control and add it as subview
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Sattelite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentedControl)
        
        // Set the constraints and activate them
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
}
