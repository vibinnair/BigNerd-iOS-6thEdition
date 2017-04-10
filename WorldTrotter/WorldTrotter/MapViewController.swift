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
        
        // Set the top constraint using layout guides (topLayoutGuide)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor)
        
        // Set the leading and trailing constraint using margins(layoutMarginsGuide)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Add a target-action pair between the segmented control and the controller, associate it with 
        // .valueChanged event
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
    }
    
    func mapTypeChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = .standard
        case 1:
            self.mapView.mapType = .hybrid
        case 2:
            self.mapView.mapType = .satellite
        default:
            break
        }
    }
}
