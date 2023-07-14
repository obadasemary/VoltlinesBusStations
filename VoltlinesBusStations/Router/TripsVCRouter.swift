//
//  TripsVCRouter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import UIKit

class TripsVCRouter {
    
    class func createTripsVC(station: Station) -> UIViewController {
        
        let tripsVC = TripsViewController()
        let router = TripsVCRouter()
        let presenter = TripsPresenter(delegate: tripsVC, router: router, station: station)
        tripsVC.presenter = presenter
        return tripsVC
    }

    func popTripsVC(view: TripsViewController) {
        view.navigationController?.popViewController(animated: true)
    }
}

