//
//  MapVC+MKMapViewDelegate.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation
import MapKit

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "pin"

        if annotation is MKUserLocation {
            return nil
        }

        annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "Point")
        } else {
            annotationView.annotation =  annotation
        }

        return annotationView
    }
}
