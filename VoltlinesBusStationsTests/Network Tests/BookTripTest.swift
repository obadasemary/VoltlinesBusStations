//
//  BookTripTest.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import XCTest
@testable import VoltlinesBusStations

final class BookTripTest: XCTestCase {

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

    func test_WhenEndPoindProvided_ThenPostDataSuccessfully() async {

        let expectation = expectation(description: "Success Expectation")
        let sut = StationsService()

        let result = await sut.bookTrip(stationId: "12", tripId: "1214")

        expectation.fulfill()

        switch result {
        case.success(let trip):
            XCTAssertTrue(trip.id != nil)
        case .failure(let error):
            XCTFail("we have an error \(error) Unfortunately")
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }

    func test_WhenEndPointProvidedWithMockAPI_ThenPostDataSuccessfully() async {

        let expectation = expectation(description: "Success Expectation")
        let sut = MockSuccessAPIService()

        let result = await sut.bookTrip(stationId: "12", tripId: "1214")
        let stub = Trip.stub

        expectation.fulfill()

        switch result {
        case.success(let trip):

            XCTAssertEqual(trip.id, stub.id)
            XCTAssertEqual(trip.busName, stub.busName)
            XCTAssertEqual(trip.time, stub.time)
        case .failure(let error):
            XCTFail("we have an error \(error) Unfortunately")
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }

    func test_WhenEndPointProvidedWithMockAPI_ThenPostDataFailure() async {

        let expectation = expectation(description: "Failure Expectation")
        let sut = MockFailureAPIService()

        let result = await sut.bookTrip(stationId: "12", tripId: "1214")

        expectation.fulfill()

        switch result {
        case.success(let trip):
            XCTFail("Fail if we have an error \(trip) Unfortunately")
        case .failure(let error):
            XCTAssertEqual(error, .noResponse)
        }

        await fulfillment(of: [expectation], timeout: 2.0)
    }
}
