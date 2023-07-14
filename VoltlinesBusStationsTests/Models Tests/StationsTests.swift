//
//  StationsTests.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class StationsTests: XCTestCase {

    func test_WhenInit_ThenDataReturn() {

        let sut = Stations.stub
        guard let station = sut.first else { return }

        XCTAssertEqual(station.centerCoordinates, Stations.stub.first?.centerCoordinates)
        XCTAssertEqual(station.id, Stations.stub.first?.id)
        XCTAssertEqual(station.name, Stations.stub.first?.name)
        XCTAssertEqual(station.trips, Stations.stub.first?.trips)
        XCTAssertEqual(station.tripsCount, Stations.stub.first?.tripsCount)
    }

    func testStationsDecoding() throws {
        let json = """
            [
                {
                    "center_coordinates": "41.09297645004368,29.003123581510543",
                    "id": 400,
                    "name": "ST-400",
                    "trips": [
                        {
                            "bus_name": "UK-20",
                            "id": 40010,
                            "time": "8:01 AM"
                        },
                        {
                            "bus_name": "KB-5",
                            "id": 40014,
                            "time": "8:10 AM"
                        }
                    ],
                    "trips_count": 4
                },
                {
                    "center_coordinates": "40.98496675,29.101067799999996",
                    "id": 1,
                    "name": "ST-1",
                    "trips": [
                        {
                            "bus_name": "UK-20",
                            "id": 210,
                            "time": "8:21 AM"
                        },
                        {
                            "bus_name": "KB-5",
                            "id": 214,
                            "time": "8:30 AM"
                        }
                    ],
                    "trips_count": 2
                }
            ]
        """

        let jsonData = Data(json.utf8)

        let decoder = JSONDecoder()
        let stations = try decoder.decode(Stations.self, from: jsonData)

        XCTAssertEqual(stations.count, 2, "Expected two station in Stations")
        XCTAssertEqual(stations[0].name, "ST-400", "Expected correct name for the first station")
        XCTAssertEqual(
            stations[1].tripsCount,
            2,
            "Expected correct trips count for the second station"
        )
    }
}
