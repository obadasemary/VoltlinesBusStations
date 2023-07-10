//
//  MapVC+CLLocationManagerDelegate.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation
import MapKit

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)

        let coordinates = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)

        let region = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(region, animated: true)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
