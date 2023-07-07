//
//  Coordinator.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 6.07.2023.
//

import UIKit

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    func setRootViewController()
}

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func setRootViewController() {
//        let viewModel = TrendingRepoViewModel()
        let mapViewController = MapViewController()
//        viewModel.coordinator = self
        self.navigationController.pushViewController(mapViewController, animated: false)
    }
}
