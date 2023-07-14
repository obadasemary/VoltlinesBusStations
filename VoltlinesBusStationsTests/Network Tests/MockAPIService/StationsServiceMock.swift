//
//  StationsServiceMock.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation
@testable import VoltlinesBusStations

final class StationsServiceMock: Mockable, StationsServiceable {

    func getStations() async -> Result<[Station], RequestError> {

        return .success(loadJSON(filename: "stations_response", type: [Station].self))
    }

    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError> {

        return .success(loadJSON(filename: "trip_response", type: Trip.self))
    }
}
