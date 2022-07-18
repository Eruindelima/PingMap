//
//  ViewController.swift
//  PingMap
//
//  Created by Virtual Machine on 14/06/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: -23.663394, longitude: -46.798726)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)),
                      animated: false)
        map.delegate = self
        addCustomPim()
    }
    
    private func addCustomPim() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "LOCAL"
        pin.subtitle = "Este é o local específico"
        map.addAnnotation(pin)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView =  map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
    
        return annotationView
    }

}
