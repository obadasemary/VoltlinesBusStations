//
//  MapVC+MapPresenterDelegate.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import Foundation

extension MapViewController: MapPresenterDelegate {

    func showIndicator() {
        activityIndicator.startAnimating()
    }

    func hideIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
    }

    func showError(error: String) {
        print("Error:", error)
    }

    func presentStations(stations: [Station]) {
        var newStations = stations
        newStations.reverse()
        DispatchQueue.main.async {
            newStations.forEach { station in
                self.setupMap(
                    name: station.name ?? "",
                    lat: station.lat,
                    long: station.long,
                    tripCount: station.tripsCount ?? 0
                )
            }
        }
    }
}
