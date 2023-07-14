//
//  Station.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

typealias Stations = [Station]

struct Station: Codable {
    let centerCoordinates: String?
    let id: Int?
    let name: String?
    let trips: [Trip]?
    let tripsCount: Int?

    enum CodingKeys: String, CodingKey {
        case centerCoordinates = "center_coordinates"
        case id, name, trips
        case tripsCount = "trips_count"
    }

    // Computed Property
    var lat: Double {
        guard let coordinates = centerCoordinates?.split(separator: ",") else {
            return 0
        }
        return Double(coordinates[0]) ?? 0
    }

    var long: Double {
        guard let coordinates = centerCoordinates?.split(separator: ",") else {
            return 0
        }
        return Double(coordinates[1]) ?? 0
    }
}
