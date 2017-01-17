//
//  FirstViewController.swift
//  Map
//
//  Created by Lucas BELVALETTE on 10/10/16.
//  Copyright © 2016 Lucas BELVALETTE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    var indexToZoom: Int?
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func mapModeChanged(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Satellite
        case 2:
            mapView.mapType = .Hybrid
        default:
            mapView.mapType = .Standard
        }
    }

    @IBAction func geolocFunc(sender: AnyObject) {
        zoomToRegion(locationManager.location!)
    }

    @IBAction func unWindSegue (segue: UIStoryboardSegue) {
        if let i = indexToZoom {
            zoomToRegion(Points.points[i].location!)
        }
    }
    
    func addPins (){
        for pin in Points.points {
            let annotation = ColorPointAnnotation(pinColor: pin.color!)
            annotation.coordinate = pin.location!.coordinate
            annotation.title = pin.name
            annotation.subtitle = pin.subTitle
            self.mapView.addAnnotation(annotation)
        }
        let location = CLLocation(latitude: 48.896684, longitude: 2.318376)
        zoomToRegion(location)
    }
    
    func initLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("this message appear only on instanciation")
        locationManager.delegate = self
        mapView.delegate = self
        initLocationManager()
        addPins()
    }
    
    func zoomToRegion(location: CLLocation) {
        let location = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMakeWithDistance(location, 1000.0, 1000.0)
        mapView.setRegion(region, animated: true)
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            let colorPointAnnotation = annotation as! ColorPointAnnotation
            pinView?.pinTintColor = colorPointAnnotation.pinColor
            pinView!.canShowCallout = true
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
}