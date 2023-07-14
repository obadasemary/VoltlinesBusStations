//
//  GetStationsTest.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class GetStationsTest: XCTestCase {

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

    func test_WhenEndPoindProvided_ThenFetchDataSuccessfully() async {

        let expectation = expectation(description: "Success Expectation")
        let sut = StationsService()

        let result = await sut.getStations()

        expectation.fulfill()

        switch result {
        case.success(let stations):
            XCTAssertTrue(stations.count > 0)
        case .failure(let error):
            XCTFail("we have an error \(error) Unfortunately")
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }

    func test_WhenEndPointProvidedWithMockAPI_ThenFetchDataSuccessfully() async {

        let expectation = expectation(description: "Success Expectation")
        let sut = MockSuccessAPIService()

        let result = await sut.getStations()
        let stub = Stations.stub
        let station = stub.first

        expectation.fulfill()

        switch result {
        case.success(let stations):
            let result = stations.first
            XCTAssertTrue(stations.count > 0)
            XCTAssertEqual(result?.centerCoordinates, station?.centerCoordinates)
            XCTAssertEqual(result?.id, station?.id)
            XCTAssertEqual(result?.name, station?.name)
            XCTAssertEqual(result?.trips, station?.trips)
            XCTAssertEqual(result?.tripsCount, station?.tripsCount)
        case .failure(let error):
            XCTFail("we have an error \(error) Unfortunately")
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }

    func test_WhenEndPointProvidedWithMockAPI_ThenFetchDataFailure() async {

        let expectation = expectation(description: "Failure Expectation")
        let sut = MockFailureAPIService()

        let result = await sut.getStations()

        expectation.fulfill()

        switch result {
        case.success(let stations):
            XCTFail("Fail if we have an error \(stations) Unfortunately")
        case .failure(let error):
            XCTAssertEqual(error, .noResponse)
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }
}
