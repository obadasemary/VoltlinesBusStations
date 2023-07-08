//
//  StationsEndpoint.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

enum StationsEndpoint {
    case stations
}

extension StationsEndpoint: Endpoint {

    var path: String {
        switch self {
        case .stations:
            return "/case-study/6/stations"
        }
    }

    var method: RequestMethod {
        switch self {
        case .stations:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .stations:
            return [
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .stations:
            return nil
        }
    }
}
