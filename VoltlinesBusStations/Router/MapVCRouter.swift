//
//  MapVCRouter.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 10.07.2023.
//

import UIKit

class MapVCRouter {

    class func createMapVC() -> UIViewController {

        let mapVC = MapViewController()
        let router = MapVCRouter()
        let presenter = MapPresenter(delegate: mapVC, router: router)
        mapVC.presenter = presenter
        let navigationController = UINavigationController(rootViewController: mapVC)
        return navigationController
    }
    
    func navigateToListTripScreen(from view: MapPresenterDelegate, station: Station) {
        
        let tripsView = TripsVCRouter.createTripsVC(station: station)
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(tripsView, animated: true)
        }
    }
}
