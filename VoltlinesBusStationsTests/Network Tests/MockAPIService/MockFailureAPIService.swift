//
//  MockFailureAPIService.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation
@testable import VoltlinesBusStations

struct MockFailureAPIService: StationsServiceable {

    func getStations() async -> Result<[Station], RequestError> {

        return .failure(.noResponse)
    }

    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError> {
        return .failure(.noResponse)
    }
}
