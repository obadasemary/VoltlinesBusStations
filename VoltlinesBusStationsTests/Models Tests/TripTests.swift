//
//  TripTests.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class TripTests: XCTestCase {

    func testWhenInit_ThenDataRetrun() {

        let sut = Trip.stub

        XCTAssertEqual(sut.id, Trip.stub.id)
        XCTAssertEqual(sut.busName, Trip.stub.busName)
        XCTAssertEqual(sut.time, Trip.stub.time)
    }

    func testTripHashing() {

        let sut = Trip.stub

        var hasher1 = Hasher()
        sut.hash(into: &hasher1)

        var hasher2 = Hasher()
        sut.hash(into: &hasher2)

        XCTAssertEqual(
            hasher1.finalize(),
            hasher2.finalize(),
            "Hash value for the same TrendingRepo instance should be equal"
        )
    }

}
