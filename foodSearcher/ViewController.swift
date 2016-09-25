//
//  ViewController.swift
//  foodSearcher
//
//  Created by Daniel Reinhart on 9/24/16.
//  Copyright © 2016 Danimiche. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var locationLabel: UILabel!
    let locationManager = CLLocationManager()
    let getLocationSpinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)

    @IBOutlet var confirmLocationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(getLocationSpinner)
        getLocationSpinner.center = self.view.center
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func getOrConfirmLocation(sender: AnyObject) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            getLocationSpinner.startAnimating()
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

}

