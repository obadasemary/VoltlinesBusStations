//
//  TripsVC+TripsPresenterDelegate.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation

extension TripsViewController: TripsPresenterDelegate {

    func showIndicator() {
        activityIndicator.startAnimating()
    }

    func hideIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
        }
    }

    func showsuccessBooking() {
        DispatchQueue.main.async {
            self.showAlert(alertType: .success)
        }
    }

    func showError() {
        DispatchQueue.main.async {
            self.showAlert(alertType: .failure)
        }
    }

    func presentTrips(with trips: [Trip]) {
        updateSnapShot(trips: trips)
    }
}
