//
//  CoordinatorTests.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 6.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class CoordinatorTests: XCTestCase {

    func test_WhenSetRootVC_ThenRootVCIsMapVC() {

        let navigationController = UINavigationController()

        let sut = MainCoordinator(navigationController)
        sut.setRootViewController()

        XCTAssertTrue(sut.navigationController.viewControllers.first is MapViewController)
    }
}
