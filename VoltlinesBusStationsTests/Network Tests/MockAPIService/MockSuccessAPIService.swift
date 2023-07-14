//
//  MockSuccessAPIService.swift
//  VoltlinesBusStationsTests
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import Foundation
@testable import VoltlinesBusStations

struct MockSuccessAPIService: StationsServiceable {

    func getStations() async -> Result<[Station], RequestError> {

        return .success(Stations.stub)
    }

    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError> {
        return .success(Trip.stub)
    }
}
