//
//  TripsViewController.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import UIKit

class TripsViewController: UIViewController, TripsPresenterDelegate {

    func showError(error: String) {
        print("TripsViewController.Error:", error)
    }

    func presentStations(station: Station) {
        print("TripsViewController.station:", station)
    }
    
    var presenter: TripsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}
