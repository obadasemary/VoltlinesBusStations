//
//  StationTests.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class StationTests: XCTestCase {

    func test_WhenInit_ThenDataReturn() {

        let sut = Station.stub

        XCTAssertEqual(sut.centerCoordinates, Station.stub.centerCoordinates)
        XCTAssertEqual(sut.id, Station.stub.id)
        XCTAssertEqual(sut.name, Station.stub.name)
        XCTAssertEqual(sut.trips, Station.stub.trips)
        XCTAssertEqual(sut.tripsCount, Station.stub.tripsCount)
    }
}
