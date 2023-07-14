//
//  Trip.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 8.07.2023.
//

import Foundation

struct Trip: Hashable, Codable {

    let identifier = UUID()
    let busName: String?
    let id: Int?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case busName = "bus_name"
        case id, time
    }

    static func == (lhs: Trip, rhs: Trip) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
