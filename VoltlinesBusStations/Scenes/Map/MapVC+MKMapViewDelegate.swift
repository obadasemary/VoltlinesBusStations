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

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {

        /* I assumed the name is unique and will not be repeated otherwise I have another solution
         you can find in my stashes also for reference here are my answers 6 years ago :D
         https://stackoverflow.com/a/51240901/3716103 On my Question https://stackoverflow.com/q/42144195/3716103
         from Feb 2017
        */
        presenter?.stations.forEach { station in
            if station.name == view.annotation?.title {
                presenter?.selectedStation = station
            }
        }

        if view.isSelected {
            listTripsButton.isHidden = false
            view.image = UIImage(named: "SelectedPoint")
        }
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {

        listTripsButton.isHidden = true
        view.image = UIImage(named: "Point")
    }
}
