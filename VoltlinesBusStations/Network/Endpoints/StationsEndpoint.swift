//
//  StationsEndpoint.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

enum StationsEndpoint {
    case stations
    case bookTrip(stationId: String, tripId: String)
}

extension StationsEndpoint: Endpoint {

    var path: String {
        switch self {
        case .stations:
            return "/case-study/6/stations"
        case .bookTrip(let stationId, let tripId):
            return "/case-study/6/stations/\(stationId)/trips/\(tripId)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .stations:
            return .get
        case .bookTrip:
            return .post
        }
    }

    var header: [String: String]? {
        switch self {
        case .stations, .bookTrip:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .stations, .bookTrip:
            return nil
        }
    }
}
