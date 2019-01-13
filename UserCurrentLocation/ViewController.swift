//
//  ViewController.swift
//  UserCurrentLocation
//
//  Created by Mayank Gupta on 13/01/19.
//  Copyright © 2019 Archidev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{
    
    @IBOutlet var map: MKMapView!
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span : MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let mylocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(mylocation, span)
        
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

