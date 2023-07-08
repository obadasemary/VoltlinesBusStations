//
//  StationsService.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

protocol StationsServiceable {
    func getStations() async -> Result<[Station], RequestError>
}

struct StationsService: HTTPClient, StationsServiceable {
    func getStations() async -> Result<[Station], RequestError> {
        return await sendRequest(endpoint: StationsEndpoint.stations, responseModel: [Station].self)
    }
}
