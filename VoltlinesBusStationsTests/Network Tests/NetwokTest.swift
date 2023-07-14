//
//  NetwokTest.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class NetwokTest: XCTestCase {

    func testGetStationsFromServiceMock() async {

        let serviceMock = StationsServiceMock()
        let result = await serviceMock.getStations()

        switch result {
        case .success(let stations):
            XCTAssertEqual(stations.first?.id, 400)
        case .failure:
            XCTFail("The request should not fail")
        }
    }

    func testBookTripFromServiceMock() async {

        let serviceMock = StationsServiceMock()
        let result = await serviceMock.bookTrip(stationId: "12", tripId: "1214")

        switch result {
        case .success(let trip):
            XCTAssertEqual(trip.id, 1214)
        case .failure:
            XCTFail("The request should not fail")
        }
    }
}

final class StationsServiceMock: Mockable, StationsServiceable {

    func getStations() async -> Result<[Station], RequestError> {

        return .success(loadJSON(filename: "stations_response", type: [Station].self))
    }

    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError> {

        return .success(loadJSON(filename: "trip_response", type: Trip.self))
    }
}
