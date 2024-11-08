//
//  MapViewController.swift
//  99GroupTask
//
//  Created by Muhammad Aditya on 08/11/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var propertyCoordinate: CLLocationCoordinate2D?
    var propertyName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if coordinates are available
        guard let coordinate = propertyCoordinate else { return }
        
        // Set the map region
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)

        // Add an annotation for the property location
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = propertyName
        mapView.addAnnotation(annotation)
    }
}
