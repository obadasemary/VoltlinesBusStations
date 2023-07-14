//
//  StationsService.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

protocol StationsServiceable {
    func getStations() async -> Result<[Station], RequestError>
    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError>
}

struct StationsService: HTTPClient, StationsServiceable {

    func getStations() async -> Result<[Station], RequestError> {
        return await sendRequest(endpoint: StationsEndpoint.stations, responseModel: [Station].self)
    }

    func bookTrip(stationId: String, tripId: String) async -> Result<Trip, RequestError> {
        return await sendRequest(
            endpoint: StationsEndpoint.bookTrip(stationId: stationId, tripId: tripId),
            responseModel: Trip.self
        )
    }
}
